<?php

namespace Majes\TeelBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * Majes\TeelBundle\Entity\UserAddress
 * @ORM\Table(name="user_address")
 * @ORM\Entity
 * @ORM\HasLifecycleCallbacks
 */
class UserAddress {

    /**
     * @var integer
     *
     * @ORM\Column(name="id", type="integer")
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="AUTO")
     */
    private $id;

    /**
     * @ORM\ManyToOne(targetEntity="Majes\CoreBundle\Entity\User\User", inversedBy="addresses", cascade={"persist"})
     * @ORM\JoinColumn(name="user_id", referencedColumnName="id")
     */
    private $user;

    /**
     * @var string
     *
     * @ORM\Column(name="title", type="string", length=255)
     */
    private $title;

    /**
     * @var string
     *
     * @ORM\Column(name="address", type="string", length=255)
     */
    private $address;

    /**
     * @var string
     *
     * @ORM\Column(name="city", type="string", length=255)
     */
    private $city;

    /**
     * @var integer
     *
     * @ORM\Column(name="zipcode", type="integer")
     */
    private $zipcode;

    /**
     * @var string
     *
     * @ORM\Column(name="country", type="string", length=255)
     */
    private $country;

    /**
     * @var string
     *
     * @ORM\Column(name="state", type="string", length=255)
     */
    private $state;

    /**
     * @var \DateTime
     *
     * @ORM\Column(name="create_date", type="datetime")
     */
    private $createDate;

    /**
     * @var \DateTime
     *
     * @ORM\Column(name="update_date", type="datetime")
     */
    private $updateDate;

    public function __construct() {
        $this->created = new \DateTime();
    }

    /**
     * Get id
     *
     * @return integer
     */
    public function getId() {
        return $this->id;
    }

    /**
     * @inheritDoc
     */
    public function setUser(\Majes\CoreBundle\Entity\User\User $user) {
        $this->user = $user;
        return $this;
    }

    /**
     * @inheritDoc
     */
    public function getUser() {
        return $this->user;
    }

    /**
     * Set title
     *
     * @param string $title
     *
     * @return UserAddress
     */
    public function setTitle($title) {
        $this->title = $title;

        return $this;
    }

    /**
     * Get title
     *
     * @return string
     */
    public function getTitle() {
        return $this->title;
    }

    /**
     * Set address
     *
     * @param string $address
     *
     * @return UserAddress
     */
    public function setAddress($address) {
        $this->address = $address;

        return $this;
    }

    /**
     * Get address
     *
     * @return string
     */
    public function getAddress() {
        return $this->address;
    }

    /**
     * Set city
     *
     * @param string $city
     *
     * @return UserAddress
     */
    public function setCity($city) {
        $this->city = $city;

        return $this;
    }

    /**
     * Get city
     *
     * @return string
     */
    public function getCity() {
        return $this->city;
    }

    /**
     * Set zipcode
     *
     * @param integer $zipcode
     *
     * @return UserAddress
     */
    public function setZipcode($zipcode) {
        $this->zipcode = $zipcode;

        return $this;
    }

    /**
     * Get zipcode
     *
     * @return integer
     */
    public function getZipcode() {
        return $this->zipcode;
    }

    /**
     * Set country
     *
     * @param string $country
     *
     * @return UserAddress
     */
    public function setCountry($country) {
        $this->country = $country;

        return $this;
    }

    /**
     * Get country
     *
     * @return string
     */
    public function getCountry() {
        return $this->country;
    }

    /**
     * Set state
     *
     * @param string $state
     *
     * @return UserAddress
     */
    public function setState($state) {
        $this->state = $state;

        return $this;
    }

    /**
     * Get state
     *
     * @return string
     */
    public function getState() {
        return $this->state;
    }
    
    /**
     * Set createDate
     *
     * @param \DateTime $createDate
     *
     * @return UserAddress
     */
    public function setCreateDate($createDate) {
        $this->createDate = $createDate;

        return $this;
    }

    /**
     * Get createDate
     *
     * @return \DateTime
     */
    public function getCreateDate() {
        return $this->createDate;
    }

    /**
     * Set updateDate
     *
     * @param \DateTime $updateDate
     *
     * @return UserAddress
     */
    public function setUpdateDate($updateDate) {
        $this->updateDate = $updateDate;

        return $this;
    }

    /**
     * Get updateDate
     *
     * @return \DateTime
     */
    public function getUpdateDate() {
        return $this->updateDate;
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
