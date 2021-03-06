<?php

namespace Majes\TeelBundle\Controller;

use Majes\CoreBundle\Controller\SystemController;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use JMS\SecurityExtraBundle\Annotation\Secure;
use Doctrine\Common\Annotations\AnnotationReader;

class IndexController extends Controller implements SystemController
{

    public function IndexAction()
    {
        
        $request = $this->getRequest();

       	return $this->_is_multilingual ? 
       		$this->redirect('/'.$this->_default_lang) : 
       		$this->render('MajesTeelBundle:Index:index.html.twig');
    }
}