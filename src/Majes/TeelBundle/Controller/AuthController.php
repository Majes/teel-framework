<?php

namespace Majes\TeelBundle\Controller;

use Majes\CoreBundle\Controller\SystemController;
use Majes\CoreBundle\Entity\User\User;
use Symfony\Component\Security\Core\Authentication\Token\UsernamePasswordToken;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\Security\Core\SecurityContext;

class AuthController extends Controller implements SystemController {

    public function registerAction() {
        $request = $this->getRequest();
        $session = $request->getSession();
        $em = $this->getDoctrine()->getManager();

        $security_context = $this->container->get('security.context');
        $social = $this->container->get('majes.social');
        $facebook_url = $social->getFacebookLoginUrl();
        $twitter_url = $social->getTwitterLoginUrl();


        if ($request->getMethod() == 'POST') {
            $firstname = $request->get('_firstname', null);
            $lastname = $request->get('_lastname', null);
            $email = $request->get('_email', null);
            $password = $request->get('_password', null);
            $social = $request->get('_social', null);
            $social_id = $request->get('_social_id', null);

            $json_social = null;
            if (!empty($social) && !empty($social_id))
                $json_social = array($social => $social_id);

            if ($user = $em->getRepository('MajesCoreBundle:User\User')
                    ->findOneBy(array('email' => $email))) {
                $user_social = $user->getSocial();
                if (array_key_exists($social, $user_social))
                    return $this->redirect($this->get('router')->generate('_majesteel_index', array('social' => $social, 'social_id' => $social_id)));
                return $this->redirect($this->get('router')->generate('_majesteel_index'));
            }

            $user = new User();
            $user->setFirstname($firstname);
            $user->setLastname($lastname);
            $user->setEmail($email);
            $user->setUsername($email);
            $user->setSocial($json_social);
            $user->setLocale('fr');

            $factory = $this->container->get('security.encoder_factory');
            $encoder = $factory->getEncoder($user);
            $pwd = $encoder->encodePassword($password, $user->getSalt());

            $user->setPassword($pwd);

            //Add user role
            $role = $em->getRepository('MajesCoreBundle:User\Role')
                    ->findOneBy(array('role' => 'ROLE_USER'));

            $user->addRole($role);

            $em->persist($user);
            $em->flush();
            $token = new UsernamePasswordToken($user, $user->getPassword(), "myaccount", $user->getRoles());
            $security_context->setToken($token);
            return $this->redirect($this->get('router')->generate('_majesteel_index'));
        }

        // get the login error if there is one
        $error = $session->get(SecurityContext::AUTHENTICATION_ERROR);
        $session->remove(SecurityContext::AUTHENTICATION_ERROR);

        return $this->render('MajesTeelBundle:Auth:register.html.twig', array('auth' => true, 'facebook_url' => $facebook_url, 'twitter_url' => $twitter_url));
    }

    public function loginAction() {
        /*
         * The action's view can be rendered using render() method
         * or @Template annotation as demonstrated in DemoController.
         *
         */
        $request = $this->getRequest();
        $session = $request->getSession();

        $social = $this->container->get('majes.social');
        $facebook_url = $social->getFacebookLoginUrl();
        $twitter_url = null;                                // $twitter_url = $social->getTwitterLoginUrl();
        $google_url = $social->getGoogleLoginUrl();


        // get the login error if there is one
        $error = $session->get(SecurityContext::AUTHENTICATION_ERROR);
        $session->remove(SecurityContext::AUTHENTICATION_ERROR);

        return $this->render('MajesTeelBundle:Auth:login.html.twig', array('auth' => true, 'facebook_url' => $facebook_url, 'twitter_url' => $twitter_url, 'google_url' => $google_url));
    }

    public function logingoogleAction() {
        $request = $this->getRequest();
        $session = $request->getSession();
        $security_context = $this->container->get('security.context');

         $em = $this->getDoctrine()->getManager();
        $gClient = new \Google_Client();
        $code = $request->get('code', null);

        $google_params = $session->get('google');
        $url = 'http://' . $this->get('request')->getHost();
        $url .= $this->get('router')->generate('_majesteel_login_google');

        $gClient->setApplicationName('flapwet');
        $gClient->setClientId($google_params['oauth2_client_id']);
        $gClient->setClientSecret($google_params['oauth2_client_secret']);
        $gClient->setDeveloperKey($google_params['oauth2_api_key']);
        $gClient->setRedirectUri($url);

        $gClient->setScopes(array("https://www.googleapis.com/auth/plus.login", "https://www.googleapis.com/auth/userinfo.email"));

        $plus = new \Google_Service_Plus($gClient);

        if (!empty($code)) {
            $gClient->authenticate($code);
            $session->set('gaccess_token', $gClient->getAccessToken());
            return $this->redirect($this->get('router')->generate('_majesteel_login_google'));
        }

        $gaccess_token = $session->get('gaccess_token');
        if (isset($gaccess_token) && $gaccess_token) {
            $gClient->setAccessToken($session->get('gaccess_token'));
        }

        $user = false;

        if ($gClient->getAccessToken()) {
            $user_profile = $plus->people->get("me");
            $session->set('gaccess_token', $gClient->getAccessToken());
            if ($user_profile) {
                $google_id = $user_profile['id'];

                if ($user = $this->getDoctrine()->getRepository('MajesCoreBundle:User\User')->getUserBySocial('google', $google_id)) {
                    $token = new UsernamePasswordToken($user, $user->getPassword(), "myaccount", $user->getRoles());
                    $security_context->setToken($token);
                    return $this->redirect($this->get('router')->generate('_majesteel_index'));
                } else {
                    if ($user = $em->getRepository('MajesCoreBundle:User\User')->findOneBy(array('email' => $user_profile['emails'][0]['value']))) {
                        return $this->redirect($this->get('router')->generate('_majesteel_index', array('social' => 'google', 'social_id' => $google_id)));
                    }

                    $social = $this->container->get('majes.social');
                    $facebook_url = $social->getFacebookLoginUrl();
                    $google_url = $social->getGoogleLoginUrl();
                    $parameters = array(
                        'lastname' => $user_profile['name']['givenName'],
                        'firstname' => $user_profile['name']['familyName'],
                        'email' => $user_profile['emails'][0]['value'],
                        'social' => 'google',
                        'social_id' => $google_id,
                        'facebook_url' => $facebook_url,
                        'twitter_url' => null,
                        'google_url' => $google_url
                    );
                    return $this->render('MajesTeelBundle:Auth:register.html.twig', $parameters);
                }
            }
        }
        return $this->redirect($this->get('router')->generate('_majesteel_login'));
    }

    public function logintwitterAction() {
        $request = $this->getRequest();
        $session = $request->getSession();

        $security_context = $this->container->get('security.context');
        $oauth_verifier = $request->get('oauth_verifier', null);
        $twitter_params = $session->get('twitter');
        // TwitterOAuth instance, with two new parameters we got in twitter_login.php
        $twitteroauth = new \TwitterOAuth($twitter_params['consumer_key'], $twitter_params['consumer_secret'], $session->get('oauth_token'), $session->get('oauth_token_secret'));
        $twitteroauth->host = "https://api.twitter.com/1.1/";  // very important, twitter migrated to 1.1 but oAuth library is still in 1.0
        // Let's request the access token
        $access_token = $twitteroauth->getAccessToken($oauth_verifier);
        // Save it in a session var
        $session->set('access_token', $access_token);
        // Let's get the user's info
        $user_info = $twitteroauth->get('account/verify_credentials');
        if ($user_info) {
            $twitter_id = $user_info['id'];
            if ($user = $this->getDoctrine()->getRepository('MajesCoreBundle:User\User')->getUserBySocial('twitter', $twitter_id)) {
                $token = new UsernamePasswordToken($user, $user->getPassword(), "myaccount", $user->getRoles());
                $security_context->setToken($token);
                return $this->redirect($this->get('router')->generate('_majesteel_index'));
            } else {

                return $this->redirect($this->get('router')->generate('_majesteel_login'));
            }
        }
        return $this->redirect($this->get('router')->generate('_majesteel_login'));
    }

    public function loginfacebookAction() {
        $security_context = $this->container->get('security.context');
        $request = $this->getRequest();
        $session = $request->getSession();
        $em = $this->getDoctrine()->getManager();

        $facebook_params = $session->get('facebook');
        if (!empty($facebook_params['app_id']) && !empty($facebook_params['app_secret'])) {
            $facebook = new \Facebook(array(
                'appId' => $facebook_params['app_id'],
                'secret' => $facebook_params['app_secret'],
            ));

            $user_id = $facebook->getUser();
            if ($user_id) {
                $user_profile = $facebook->api('/me', 'GET');
                $facebook_id = $user_profile['id'];

                if ($user = $em->getRepository('MajesCoreBundle:User\User')->getUserBySocial('facebook', $facebook_id)) {
                    $token = new UsernamePasswordToken($user, $user->getPassword(), "myaccount", $user->getRoles());
                    $security_context->setToken($token);
                    return $this->redirect($this->get('router')->generate('_majesteel_index'));
                } else {
                    if ($user = $em->getRepository('MajesCoreBundle:User\User')->findOneBy(array('email' => $user_profile['email']))) {
                        return $this->redirect($this->get('router')->generate('_majesteel_index', array('social' => 'facebook', 'social_id' => $facebook_id)));
                    }

                    $social = $this->container->get('majes.social');
                    $facebook_url = $social->getFacebookLoginUrl();
                    $google_url = $social->getGoogleLoginUrl();
                    $parameters = array(
                        'firstname' => $user_profile['first_name'],
                        'lastname' => $user_profile['last_name'],
                        'email' => $user_profile['email'],
                        'social' => 'facebook',
                        'social_id' => $facebook_id,
                        'facebook_url' => $facebook_url,
                        'twitter_url' => null,
                        'google_url' => $google_url
                    );
                    return $this->render('MajesTeelBundle:Auth:register.html.twig', $parameters);
                }
            } else {
                return $this->redirect($this->get('router')->generate('_majesteel_login'));
            }
        } else {
            return $this->redirect($this->get('router')->generate('_majesteel_login'));
        }
    }

    public function loginCheckAction() {
        /*
         * The action's view can be rendered using render() method
         * or @Template annotation as demonstrated in DemoController.
         *
         */

        $request = $this->getRequest();
        $em = $this->getDoctrine()->getManager();

        $social = $request->get('social', null);
        $social_id = $request->get('social_id', null);
        $email = $request->get('_email', null);


        if (!empty($social) && !empty($social_id) && $user = $user = $em->getRepository('MajesCoreBundle:User\User')->findOneBy(array('email' => $email))) {
            $user_json = $user->getSocial();
            $user_json[$social] = $social_id;
            $user->social = $user_json;

            $em->persist($user);
            $em->flush();
        }

        return $this->render('MajesCoreBundle:Auth:login.html.twig');
    }

    public function registerCheckAction() {
        /*
         * The action's view can be rendered using render() method
         * or @Template annotation as demonstrated in DemoController.
         *
         */
        return $this->render('MajesCoreBundle:Auth:register.html.twig');
    }

}
