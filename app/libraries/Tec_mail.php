<?php

defined('BASEPATH') or exit('No direct script access allowed');
/*
*  ==============================================================================
*  Author   : Mian Saleem
*  Email    : saleem@tecdiary.com
*  Web      : http://tecdiary.com
*  ==============================================================================
*/

use PHPMailer\PHPMailer\OAuth;
use PHPMailer\PHPMailer\Exception;
use PHPMailer\PHPMailer\PHPMailer;
use League\OAuth2\Client\Provider\Google;

class Tec_mail
{
    public function __construct()
    {
    }

    public function __get($var)
    {
        return get_instance()->$var;
    }

    public function send_mail($to, $subject, $body, $from = null, $from_name = null, $attachment = null, $cc = null, $bcc = null)
    {
        // $mail = new PHPMailer;
        $mail          = new PHPMailer(true);
        $mail->CharSet = 'UTF-8';
        try {
            if (DEMO) {
                $mail->isSMTP();
                $mail->Host     = '127.0.0.1';
                $mail->SMTPAuth = true;
                $mail->Port     = 2525;
                $mail->Username = 'SMA';
                $mail->Password = '';
            } elseif ($this->Settings->protocol == 'mail') {
                $mail->isMail();
            } elseif ($this->Settings->protocol == 'sendmail') {
                $mail->isSendmail();
            } elseif ($this->Settings->protocol == 'smtp') {
                $mail->isSMTP();
                $mail->Host       = $this->Settings->smtp_host;
                $mail->SMTPAuth   = true;
                $mail->SMTPSecure = !empty($this->Settings->smtp_crypto) ? $this->Settings->smtp_crypto : false;
                $mail->Port       = $this->Settings->smtp_port;
                // $mail->SMTPDebug  = 2;
                if ($this->Settings->smtp_oauth2) {
                    $email        = $this->Settings->smtp_user;
                    $clientId     = $this->config->item('client_id');
                    $clientSecret = $this->config->item('client_secret');
                    $refreshToken = $this->config->item('refresh_token');

                    $this->mail->AuthType = 'XOAUTH2';

                    $provider = new Google(['clientId' => $clientId, 'clientSecret' => $clientSecret]);

                    $this->mail->setOAuth(new OAuth([
                        'provider'     => $provider,
                        'clientId'     => $clientId,
                        'clientSecret' => $clientSecret,
                        'refreshToken' => $refreshToken,
                        'userName'     => $email,
                    ]));
                } else {
                    $mail->Username = $this->Settings->smtp_user;
                    $mail->Password = $this->Settings->smtp_pass;
                }
            } else {
                $mail->isMail();
            }

            if ($from && $from_name) {
                $mail->setFrom($from, $from_name);
                $mail->addReplyTo($from, $from_name);
            } elseif ($from) {
                $mail->setFrom($from, $this->Settings->site_name);
                $mail->addReplyTo($from, $this->Settings->site_name);
            } else {
                $mail->setFrom($this->Settings->default_email, $this->Settings->site_name);
                $mail->addReplyTo($this->Settings->default_email, $this->Settings->site_name);
            }

            $mail->addAddress($to);
            if ($cc) {
                $mail->addCC($cc);
            }
            if ($bcc) {
                try {
                    if (is_array()) {
                        foreach ($bcc as $bcc_email) {
                            $mail->addBCC($bcc_email);
                        }
                    } else {
                        $mail->addBCC($bcc);
                    }
                } catch (phpmailerException $e) {
                    log_message('info', 'PHPMailer Error: ' . $e->getMessage());
                }
            }
            $mail->Subject = $subject;
            $mail->isHTML(true);
            $mail->Body = $body;
            if ($attachment) {
                if (is_array($attachment)) {
                    foreach ($attachment as $attach) {
                        $mail->addAttachment($attach);
                    }
                } else {
                    $mail->addAttachment($attachment);
                }
            }

            if (!$mail->send()) {
                throw new Exception($mail->ErrorInfo);
                return false;
            }
            return true;
        } catch (Exception $e) {
            throw new \Exception($e->errorMessage());
        } catch (\Exception $e) {
            throw new \Exception($e->getMessage());
        }
    }
}
