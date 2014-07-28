<?php

// src/Majes/TeelBundle/Form/User/UserAddressType.php

namespace Majes\TeelBundle\Form\User;

use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\Validator\Constraints\NotBlank;
use Symfony\Component\OptionsResolver\OptionsResolverInterface;

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
                ->add('city', 'text', array(
                    'required' => true,
                    'constraints' => array(
                        new NotBlank())))
                ->add('country', 'text', array(
                    'required' => true,
                    'constraints' => array(
                        new NotBlank())))
                ->add('state', 'text', array(
                    'required' => true,
                    'constraints' => array(
                        new NotBlank())))
                ->add('id', 'hidden');
    }
    public function setDefaultOptions(OptionsResolverInterface $resolver)
    {
        $resolver->setDefaults(array(
          'data_class' => 'Majes\TeelBundle\Entity\userAddress'
        ));
    }
    public function getName() {
        return 'userAddress';
    }

}
