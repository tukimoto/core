<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>License Information</title>
</head>
<body>
    <h1>ライセンス情報</h1>

    <div id="licenseInfo">
        {% if licenseInfo %}
        <div class="form-group">
            <label>ライセンスキー:</label>
            <input type="text" value="{{ licenseInfo.key }}" readonly>
        </div>
        <div class="form-group">
            <label>有効期限:</label>
            <input type="text" id="expirationDate" value="{{ licenseInfo.expiration }}" readonly>
        </div>
        <div class="form-group">
            <label>残日数:</label>
            <input type="text" id="daysRemaining" readonly>
        </div>
        {% else %}
        <p>ライセンス情報が見つかりません。</p>
        {% endif %}
    </div>

    <script>
        // 残日数を計算するJavaScript
        document.addEventListener("DOMContentLoaded", function () {
            var expirationDate = "{{ licenseInfo.expiration }}";  // PHPで取得した有効期限
            var expiration = new Date(expirationDate);
            var today = new Date();

            // 残り日数の計算
            var timeDiff = expiration.getTime() - today.getTime();
            var daysRemaining = Math.ceil(timeDiff / (1000 * 3600 * 24));

            // 残日数を表示
            document.getElementById("daysRemaining").value = daysRemaining + " 日";
        });
    </script>
</body>
</html>
