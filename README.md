
# InsideSoftwaresCloudConfig


Projeto responsavel pelo controle e distribuição dos properties de cada microserviço dos sistemas da Inside Softwares
* Versão disponivel: 1.0-SNAPSHOT

## Framework Utilizado

* [Spring Boot]('https://spring.io/projects/spring-boot')
  * Versão: 2.7.2
* [Java]('https://www.java.com/pt-BR/')
  * Versão: 17 ou superior

## Usado pelos projetos

Esse projeto é usado pelas seguintes empresas:

- [InsideSoftwaresAuthenticator]('https://github.com/InsideSoftwares/InsideSoftwaresAuthenticator') 
- [InsideSoftwaresAccessControl]('https://github.com/InsideSoftwares/access_control_back')

## Build do projeto

  * Realizar o clone do projeto
  * Na pasta do clone rodar o seguinte comando ``` mvn clean install ``` projeto ira buildar

## Utilização em demais projetos

  * Importa no pom do projeto Spring: 
  ```
    <dependencyManagement>
      <dependencies>
        <dependency>
            <groupId>org.springframework.cloud</groupId>
            <artifactId>spring-cloud-dependencies</artifactId>
            <version>2021.0.3</version>
            <type>pom</type>
            <scope>import</scope>
        </dependency>
      </dependencies>
    </dependencyManagement>

    <dependency>
        <groupId>org.springframework.cloud</groupId>
        <artifactId>spring-cloud-starter-config</artifactId>
    </dependency>
    <dependency>
        <groupId>org.springframework.cloud</groupId>
        <artifactId>spring-cloud-starter-bootstrap</artifactId>
    </dependency>
  ```

  * Será necessário criar um arquivo chamado ```bootstrap.properties``` no projeto:
  ```
    spring.application.name=Inside_Authenticator
    spring.profiles.active=native
    spring.cloud.config.uri=http://localhost:8888
    spring.cloud.config.username=config
    spring.cloud.config.password=config
  ```