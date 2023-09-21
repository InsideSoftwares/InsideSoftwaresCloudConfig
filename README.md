# InsideSoftwaresCloudConfig

Projeto responsavel pelo controle e distribuição dos properties de cada microserviço dos sistemas da Inside Softwares
* Versão disponivel: 1.0-SNAPSHOT

## Framework Utilizado

* [Spring Boot](https://spring.io/projects/spring-boot)
  * Versão: 3.1.4
* [GraalVM](https://www.graalvm.org/)
  * Versão: 21 ou superior

## Build do projeto

  * Realizar o clone do projeto
  * Na pasta do clone rodar o seguinte comando ``` mvn clean install -Pnative ``` projeto ira buildar

## Environment personalizaveis

  * `CLOUD_CONFIG_PORT`
    * Define a porta com qual o serviço vai esta acessível
    * Default: `8888`
  * `CLOUD_CONFIG_PROFILES`
    * Define os Profiles para executar o serviço
    * Default: `native`
  * `CLOUD_CONFIG_NAME`
    * Define o usuario para logar no sistema: InsideSoftwaresCloudConfig
    * Default: `ADMIN`
  * `CLOUD_CONFIG_PASSWORD`
    * Define o usuario para senha no sistema: InsideSoftwaresCloudConfig
    * Default: `ADMIN`
  * `CLOUD_CONFIG_SEARCH_LOCATIONS`
    * Define o caminho com os proprerties dos sistemas
    * Default: `~/properties`
  * `CLOUD_CONFIG_KEY`
    * Define a chave para realizar a encriptação das senhas nos properties
    * Default: `foM}kcGHmxB7[C9`
* `LOGBACK_LOG_DIR`
  * Define local em que será salvo os logs do serviço

## Realizar encriptação e descriptação dos properties

  Utilizar a collection: [InsideSoftwaresCloudConfig.postman_collection.json](etc%2Fpostman%2FInsideSoftwaresCloudConfig.postman_collection.json)
  que possui os exemplos para realizar

## Utilização em demais projetos

  * Importa no pom do projeto Spring:
  ```xml
    <dependencyManagement>
      <dependencies>
        <dependency>
            <groupId>org.springframework.cloud</groupId>
            <artifactId>spring-cloud-dependencies</artifactId>
            <version>2022.0.4</version>
            <type>pom</type>
            <scope>import</scope>
        </dependency>
      </dependencies>
    </dependencyManagement>
  ```
  ```xml
    <dependencies>
      <dependency>
        <groupId>org.springframework.cloud</groupId>
        <artifactId>spring-cloud-starter-config</artifactId>
      </dependency>
      <dependency>
        <groupId>org.springframework.cloud</groupId>
        <artifactId>spring-cloud-starter-bootstrap</artifactId>
      </dependency>
    </dependencies>
  ```
  * Será necessário criar um arquivo chamado ```bootstrap.yml``` no projeto:
  ```yml
    spring:
      profiles:
        active: ${CLOUD_PROFILES:native}
      cloud:
        config:
          uri: ${CLOUD_CONFIG_URI:http://localhost:8888}
          username: ${CLOUD_CONFIG_NAME:ADMIN}
          password: ${CLOUD_CONFIG_PASSWORD:ADMIN}
  ```
