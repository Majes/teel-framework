<?php

namespace Majes\TeelBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * Majes\TeelBundle\Entity\UserData
 * @ORM\Entity
 * @ORM\Table(name="user_data")
 * @ORM\HasLifecycleCallbacks
 */
class UserData
{
    /**
     * @ORM\Column(name="id", type="integer")
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="AUTO")
     */
    private $id;

    /**
     * @ORM\Column(name="update_date", type="datetime", nullable=false)
     */
    private $updateDate;

    /**
     * @ORM\Column(name="create_date", type="datetime", nullable=false)
     */
    private $createDate;


    public function __construct(){
        
    }

    /**
     * Gets the value of id.
     *
     * @return mixed
     */
    public function getId()
    {
        return $this->id;
    }

    /**
     * Gets the value of updateDate.
     *
     * @return mixed
     */
    public function getUpdateDate()
    {
        return $this->updateDate;
    }

    /**
     * Sets the value of updateDate.
     *
     * @param mixed $updateDate the update date
     *
     * @return self
     */
    public function setUpdateDate($updateDate)
    {
        $this->updateDate = $updateDate;

        return $this;
    }

    /**
     * Gets the value of createDate.
     *
     * @return mixed
     */
    public function getCreateDate()
    {
        return $this->createDate;
    }

    /**
     * Sets the value of createDate.
     *
     * @param mixed $createDate the create date
     *
     * @return self
     */
    public function setCreateDate($createDate)
    {
        $this->createDate = $createDate;

        return $this;
    }

    /**
     *
     * @ORM\PrePersist
     * @ORM\PreUpdate
     */
    public function updatedTimestamps()
    {
        $this->setUpdateDate(new \DateTime(date('Y-m-d H:i:s')));

        if($this->getCreateDate() == null)
        {
            $this->setCreateDate(new \DateTime(date('Y-m-d H:i:s')));
        }
    }

    
}