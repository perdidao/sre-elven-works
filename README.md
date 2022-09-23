# Projeto integrador - Elven Works

## Objetivo do Desafio
Criar um servidor com o site WordPress na AWS de forma automatizada.  

## Requisitos
- ~~Conta válida na AWS~~
- ~~Terraform instalado~~
- ~~Conhecimento de Ansible~~

## Passos do Desafio
- Provisionar recursos abaixo com Terraform:
  - ~~VPC~~
  - ~~EC2~~
  - Memcache *
  - ~~RDS~~
  - Load Balancer *
- ~~Instalar o Wordpress com Ansible nas instancias EC2~~
- Arquitetura com alta disponibilidade multizona *
- ~~Configurar banco de dados em outro servidor (RDS)~~
- Repositório de sessões Memcache em outro servidor *
- Arquitetura elástica com VMs e autoscaling *
- Configurar Load *
- Arquitetura com CDN/WAF na frente do wordpress *
  - [Cloudflare](https://www.cloudflare.com/pt-br/plans/#overview)
  - [Serviço WAF](https://aws.amazon.com/pt/waf/pricing/)

(*) Passo opcional  
