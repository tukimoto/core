<?php

namespace OPNsense\YourModule\Controllers;

use OPNsense\Base\UIController;

class LicenseController extends UIController
{
    public function indexAction()
    {
        // WebAPIからライセンス情報を取得
        $licenseKey = "KLM789-NOP012-UVW345-XYZ678"; // 必要に応じてライセンスキーを設定
        $url = "https://test-utmlicense.tomoya-maeda-sys.workers.dev/?licenseKey=" . $licenseKey;

        // WebAPIからデータを取得
        $licenseInfo = $this->fetchLicenseInfo($url);

        // 取得したデータをビューに渡す
        $this->view->licenseInfo = json_decode($licenseInfo, true);
        $this->view->pick('/license'); // ビューのテンプレートを指定
    }

    // WebAPIからデータを取得する関数
    private function fetchLicenseInfo($url)
    {
        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL, $url);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($ch, CURLOPT_TIMEOUT, 10);
        $response = curl_exec($ch);
        curl_close($ch);
        return $response;
    }
}
