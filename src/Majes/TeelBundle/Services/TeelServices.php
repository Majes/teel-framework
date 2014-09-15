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

}
