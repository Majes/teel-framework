<?php

// src/Majes/TeelBundle/Form/Type/User/UserAddressType.php

namespace Majes\TeelBundle\Form\Type\User;

use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\Validator\Constraints\NotBlank;

class UserAddressType extends AbstractType {

    public function buildForm(FormBuilderInterface $builder, array $options) {
        $builder->add('title', 'text', array(
                    'required' => true,
                    'constraints' => array(
                        new NotBlank())))
                ->add('address', 'text', array(
                    'required' => true,
                    'constraints' => array(
                        new NotBlank())))
                ->add('zipcode', 'number', array(
                    'required' => true,
                    'constraints' => array(
                        new NotBlank())))
                ->add('id', 'hidden');
    }

    public function getName() {
        return 'userAddress';
    }

}
