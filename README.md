# CASHBACK TEST

Um desafio bem interessante, um cadastro de ofertas bem simples e funcional.

####Heroku
https://cash-back-lemoney.herokuapp.com/
####Administração
https://cash-back-lemoney.herokuapp.com/admin

- email: admin@admin.com.br
- senha: admin123

###Instação
Desconpactar o zip, adicionar a versão do ruby no seu Sistema Operacional (Exemplo: no Linux, o [RVM](https://https://rvm.io/) ) Ruby 2.6.6
```sh
$ bundle
$ yarn install
$ rake db:create db:migrate db:seed
$ rails s
```

####Dependências :
* [RailsAdmin](https://github.com/sferik/rails_admin) foi utilizado para gerenciar o painel administrativo (/admin)
* Devise
* CanCanCan
* SimpleCov

####Testes
Relatório de cobertura no diretório /coverage em apenas 35.94%
