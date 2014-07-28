<?php

// src/Majes/TeelBundle/Form/User/UserDataType.php

namespace Majes\TeelBundle\Form\User;

use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\Validator\Constraints\NotBlank;
use Symfony\Component\OptionsResolver\OptionsResolverInterface;

class UserDataType extends AbstractType {

    public function buildForm(FormBuilderInterface $builder, array $options) {
        
    }

    public function setDefaultOptions(OptionsResolverInterface $resolver)
	{
		$resolver->setDefaults(array(
		  'data_class' => 'Majes\TeelBundle\Entity\UserData'
		));
	}

    public function getName() {
        return 'userData';
    }

}
