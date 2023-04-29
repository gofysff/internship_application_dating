# Приложение со стажировки

## Что нужно было сделать?

Нужно было реализовать макет экранов регистрации пользователей в Tinder-подобном приложении для знакомств, при этом использовался State Management - *MobX* и инъекция зависимостей через *Provider*

Также требовалось реализовать логику работы с сервером на основе *JWT-токенов*, реализуя взаимодействие с сервером на основе REST API через библиотеку *Dio*, сохраняя при этом refresh-токен в защищенное хранилище используя библиотеку *secure storage*

## Что имели?

## Коммуникация с тим лидом
Тут было все очень просто
Раз в неделю можно было поспрашивать некоторые вопросы относительно архитектуры

Но основная работа и обучение было проведено в одиночку

### Макет в фигме с готовым дизайном


<table>
    <tr>
    <td><img src="readme_assets/1_start_screen.png" width=188 height=406></td>
    <td><img src="readme_assets/2_phone_number.png" width=188 height=406></td>
    <td><img src="readme_assets/3_OTP_code.png" width=188 height=406></td>
</tr>
</table>
<!-- ![Start screen](readme_assets/1_start_screen.png)
 ![Phone number](readme_assets/2_phone_number.png)
![OTP](readme_assets/3_OTP_code.png) -->

Дальше после ввода otp-кода происходит либо логин, либо дальнейшая регистрация


<table>
    <tr>
        <td><img src="readme_assets/4_your_first_name_is.png" width=188 height=406></td>
        <td><img src="readme_assets/5_your_birthday_is.png" width=188 height=406></td>
        <td><img src="readme_assets/6_your_nickname.png" width=188 height=406></td>
    </tr>
    <tr>
        <td><img src="readme_assets/7_you_are_a.png" width=188 height=406></td>
        <td><img src="readme_assets/8_show_you.png" width=188 height=406></td>
</tr>
</table>
<!-- ![first name](readme_assets/4_your_first_name_is.png)
![birthday](readme_assets/5_your_birthday_is.png)
![nickname](readme_assets/6_your_nickname.png)
![u r](readme_assets/7_you_are_a.png)
![show u](readme_assets/8_show_you.png) -->

### Что получил по итогу?

Готовый проект, выполняющий все требуемые задачи(но работа с бэком была реализована только на макетах(в частности с pace-holderом, тк бэк по итогу не предоставили))

Запускайте, поглядите:)
