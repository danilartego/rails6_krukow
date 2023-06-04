# Уроки по Ruby on Rails 6
lesson_13a
Приложение создано по урокам Ильи Круковского

## Урок 1
Предварительная установка программ и настройка окружения.
Обновление программ и установка дополнения  
```
sudo apt update && sudo apt upgrade -y
sudo apt install curl gnupg2 git sqlite3 -y
```
Установка RVM (окружение для уравление RUBY)
```
gpg2 --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB`
\curl -sSL https://get.rvm.io | bash -s stable
```
Устанока NVM (окружение для уравление NODE)  
```
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.2/install.sh | bash
```
Установка Node v16 (версия 18 и выше могут быть проблемы)
```
nvm install 16
```
Удалить Node
```
nvm deactivate
nvm unlink
nvm uninstall VERSION
```
Установка YARN  
```
npm install yarn --global
```
Установка RUBY v3.1.2  
```
rvm install 3.1.2
```
Установка RAILS и других Джемов  
```
gem install rails
gem install rails -v 6.1.7
```
Для отключения генерации документации с командой gem install используют флаги `gem install rails —no-rdoc —no-ri`
Однако есть вариант получше — использовать файл .gemrc в вашей home/USER директории
`gem: —no-rdoc  —no-ri`
Отключение автотестов при создании приложения Rails  
```
rails new -T NAME_FOLDER
```
Проблемы с Webpacker (for git clone)
```
rake assets:precompile
```
Дополнения по Webpacker
```
yarn remove @rails/webpacker
rm -rf ./node_modules
yarn add @rails/webpacker@^5.2.1
rails webpacker:install
```
### Урок 2
Создаем модель Question
```
rails g model Question title:string body:text
```
Содаем окружение разработки и базу данных
```
# Для Linux
RAIL_ENV=development rails db:create
# Для Windows
rails db:create RAIL_ENV=development
```
Создаем миграцию в базу данных
```
rails db:migrate
```
Отменить миграции
```
# Отменить все миграции
rails db:rollback
# Отменить последние 2 миграции
rails db:rollback STEP=2
```
Тест запросов в базу данных через консоль
```
# Открываем консоль
rails c
# Создаем вопрос
q = Question.new
# Создаем вопрос передаем ему заголовок и тело вопроса
q = Question.new title:"My First Question", body: "Simple Text"
# Записывает вопрос в базу данных
q.save
# Обновить заголовок
q.update title: "Updated Title"
# Вывести все вопросы
Question.all
# Найти вопрос по заголовку
Question.find_by title:"My First Question"
# Удалить вопрос
q.destroy
```

### Урок 3
CRUD создание чтение обновление удаление


### Урок 4
Сообщения и стили
```
bundle outdate
bundle update
yarn add bootstrap
yarn upgrade
```
https://github.com/twbs/bootstrap

app/assets/bootstrap.scss:
- @import 'bootstrap/scss/bootstrap.scss';

app/assets/application.scss:
- @import 'bootstrap';