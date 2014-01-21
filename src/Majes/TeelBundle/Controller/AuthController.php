<?php

namespace Majes\TeelBundle\Controller;

use Majes\CoreBundle\Controller\SystemController;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\Security\Core\SecurityContext;

class AuthController extends Controller implements SystemController
{


    public function loginAction()
    {
        /*
         * The action's view can be rendered using render() method
         * or @Template annotation as demonstrated in DemoController.
         *
         */

		$request = $this->getRequest();
        $session = $request->getSession();

		$facebook_params = $session->get('facebook');
		if(!empty($facebook_params['app_id']) 
			&& !empty($facebook_params['app_secret'])){
			$facebook = new \Facebook(array(
		  		'appId'  => $facebook_params['app_id'],
		  		'secret' => $facebook_params['app_secret'],
			));
			
			$url = 'http://'.$this->getRequest()->getHost();
			$url .= $this->get('router')->generate('_majesteel_login_facebook');
			
			$params = array(
			  'scope' => 'read_stream, friends_likes, email, publish_stream',
			  'redirect_uri' => $url
			);
			
			$facebook_url = $facebook->getLoginUrl($params);
		}else
		{
			$facebook_url = false;
		}

        // get the login error if there is one
        $error = $session->get(SecurityContext::AUTHENTICATION_ERROR);
        $session->remove(SecurityContext::AUTHENTICATION_ERROR);

        return $this->render('MajesTeelBundle:Auth:login.html.twig', array('auth' => true, 'facebook_url' => $facebook_url));
    }


	public function loginfacebookAction(){
		
		$request = $this->getRequest();
        $session = $request->getSession();
		
		$facebook_params = $session->get('facebook');
		if(!empty($facebook_params['app_id']) 
			&& !empty($facebook_params['app_secret'])){
			$facebook = new \Facebook(array(
		  		'appId'  => $facebook_params['app_id'],
		  		'secret' => $facebook_params['app_secret'],
			));
			
			$user_id = $facebook->getUser();
			if($user_id){
				
				$user_profile = $facebook->api('/me','GET');

			}else{
				return $this->redirect($this->get('router')->generate('_majesteel_login'));
			}
		}else
		{
			$facebook_url = false;
		}
		//echo $this->get('router')->generate('_majesteel_account'); exit;
		return $this->redirect($this->get('router')->generate('_majesteel_account'));
	}

    public function loginCheckAction()
    {
        /*
         * The action's view can be rendered using render() method
         * or @Template annotation as demonstrated in DemoController.
         *
         */
        return $this->render('MajesCoreBundle:Auth:login.html.twig');
    }
}
