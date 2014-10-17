<?php

namespace Majes\TeelBundle\Services;

use Doctrine\ORM\EntityManager;

class TeelServices {

    private $_em;

    public function __construct($em) {
        $this->_em = $em;
    }

    public function Sitemap($sitemap, $host){
        

        return $sitemap;
    
    }

    public function SlugMe($text){
		// replace non letter or digits by -
		$text = preg_replace('~[^\\pL\d]+~u', '-', $text);

		// trim
		$text = trim($text, '-');

		// transliterate
		//$text = iconv('utf-8', 'us-ascii//TRANSLIT', $text);

		// lowercase
		$text = strtolower($text);

		// remove unwanted characters
		$text = preg_replace('~[^-\w]+~', '', $text);

		if (empty($text))
		{
		return 'n-a';
		}

		return $text;
    }

    public function getWidgets(){
    	$widgets = array('users' => array('label' => 'Users', 
	                                'number' => array("icon" => "icon-user", "value" => count($this->_em->getRepository('MajesCoreBundle:User\User')->findAll()) ), 
	                                'active'=> array("icon" => "icon-ok", "value" => count($this->_em->getRepository('MajesCoreBundle:User\User')->findBy(array('isActive' => true, 'deleted' => false))) ), 
	                                'deleted' => array("icon" => "icon-trash", "value" =>count($this->_em->getRepository('MajesCoreBundle:User\User')->findBy(array('deleted' => true)))) ),
	                    'domains' => array('label' => 'Domains', 
	                                'number' => array("icon" => "icon-globe", "value" => count($this->_em->getRepository('MajesCoreBundle:Host')->findAll()) ), 
	                                'active'=> array("icon" => "icon-ok", "value" => count($this->_em->getRepository('MajesCoreBundle:Host')->findBy(array('deleted' => false))) ), 
	                                'deleted' => array("icon" => "icon-trash", "value" =>count($this->_em->getRepository('MajesCoreBundle:Host')->findBy(array('deleted' => true)))) ),
	                    'pages' => array('label' => 'Pages', 
	                                'number' => array("icon" => "icon-file-alt", "value" => count($this->_em->getRepository('MajesCmsBundle:PageLang')->findAll()) ), 
	                                'active'=> array("icon" => "icon-ok", "value" => count($this->_em->getRepository('MajesCmsBundle:PageLang')->findBy(array('deleted' => false))) ), 
	                                'deleted' => array("icon" => "icon-trash", "value" =>count($this->_em->getRepository('MajesCmsBundle:PageLang')->findBy(array('deleted' => true)))) ),
	                    'media' => array('label' => 'Medias', 
	                                'number' => array("icon" => "icon-picture", "value" => count($this->_em->getRepository('MajesMediaBundle:Media')->findAll()) )),
	                    'language' => array('label' => 'Languages', 
	                                'number' => array("icon" => "icon-flag-alt", "value" => count($this->_em->getRepository('MajesCoreBundle:Language')->findAll()) ), 
	                                'flags' => $this->_em->getRepository('MajesCoreBundle:Language')->findAll()),
	                    'activity' => array('label' => "Today's Activity",
	                                'number' => array('icon' => 'icon-stackexchange', 'value' => count($this->_em->getRepository('MajesCoreBundle:Log')->getActivityReal($type = 'day', $page = 1, $limit = 200))))
	               );

    	return $widgets;
    }

}
