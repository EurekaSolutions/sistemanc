<?php

abstract class UsrController extends Controller
{
	public $layout='//layouts/main';
	/**
	 * Sends out an email containing instructions and link to the email verification
	 * or password recovery page, containing an activation key.
	 * @param CFormModel $model it must have a getIdentity() method
	 * @param strign $mode 'recovery', 'verify' or 'oneTimePassword'
	 * @return boolean if sending the email succeeded
	 */
	public function sendEmail(CFormModel $model, $mode)
	{
		$mail = $this->module->mailer;
		$mail->AddAddress($model->getIdentity()->getEmail(), $model->getIdentity()->getName());
		$params = array(
			'siteUrl' => $this->createAbsoluteUrl('/'),
			'usuario' => $model->getIdentity()->usuario,
			'correo' => $model->getIdentity()->correo,
		);
		switch($mode) {
			default: return false;
			case 'recovery':
			case 'verify':
				$mail->Subject = $mode == 'recovery' ? Yii::t('UsrModule.usr', 'Recuperar la contraseña') : Yii::t('UsrModule.usr', 'Verificación de la dirección de correo electrónico');
				$params['actionUrl'] = $this->createAbsoluteUrl('default/'.$mode, array(
					'llave_activacion'=>$model->getIdentity()->getActivationKey(),
					'usuario'=>$model->getIdentity()->getName(),
				));
				break;
			case 'oneTimePassword':
				$mail->Subject = Yii::t('UsrModule.usr', 'One Time Password');
				$params['code'] = $model->getNewCode();
				break;
		}
		$body = $this->renderPartial($mail->getPathViews().'.'.$mode, $params, true);
		$full = $this->renderPartial($mail->getPathLayouts().'.email', array('content'=>$body), true);
		$mail->MsgHTML($full);
		if ($mail->Send()) {
			return true;
		} else {
			Yii::log($mail->ErrorInfo, 'error');
			return false;
		}
	}
}
