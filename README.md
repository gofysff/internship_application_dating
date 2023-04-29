# Приложение со стажировки

## Что нужно было сделать?

Нужно было реализовать макет экранов регистрации пользователей в Tinder-подобном приложении для знакомств, при этом использовался State Management - *MobX* и инъекция зависимостей через *Provider*

Также требовалось реализовать логику работы с сервером на основе *JWT-токенов*, реализуя взаимодействие с сервером на основе REST API через библиотеку *Dio*, сохраняя при этом refresh-токен в защищенное хранилище используя библиотеку *secure storage*

## Что имели?

### Макет в фигме с готовым дизайном


<table>
    <tr>
    <td><img src="readme_assets/1_start_screen.png" width=270 height=450></td>
    <td><img src="readme_assets/2_phone_number.png" width=270 height=450></td>
    <td><img src="readme_assets/3_OTP_code.png" width=270 height=450></td>
</tr>
</table>
<!-- ![Start screen](readme_assets/1_start_screen.png)
 ![Phone number](readme_assets/2_phone_number.png)
![OTP](readme_assets/3_OTP_code.png) -->

Дальше после ввода otp-кода происходит либо логин, либо дальнейшая регистрация


<table>
    <tr>
        <td><img src="readme_assets/4_your_first_name_is.png" width=270 height=450></td>
        <td><img src="readme_assets/5_your_birthday_is.png" width=270 height=450></td>
        <td><img src="readme_assets/6_your_nickname.png" width=270 height=450></td>
    </tr>
    <tr>
        <td><img src="readme_assets/7_you_are_a.png" width=270 height=450></td>
        <td><img src="readme_assets/8_show_you.png" width=270 height=450></td>

    </tr>
</table>
<!-- ![first name](readme_assets/4_your_first_name_is.png)
![birthday](readme_assets/5_your_birthday_is.png)
![nickname](readme_assets/6_your_nickname.png)
![u r](readme_assets/7_you_are_a.png)
![show u](readme_assets/8_show_you.png) -->
