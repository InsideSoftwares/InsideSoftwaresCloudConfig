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

  * `CLOUD_PORT`
    * Define a porta com qual o serviço vai esta acessível
    * Default: `8888`
  * `CLOUD_PROFILES`
    * Define os Profiles para executar o serviço
    * Default: `native`
  * `CLOUND_ADMIN_NAME`
    * Define o usuario para logar no sistema: InsideSoftwaresCloudConfig
    * Default: `ADMIN`
  * `CLOUND_ADMIN_PASSWORD`
    * Define o usuario para senha no sistema: InsideSoftwaresCloudConfig
    * Default: `ADMIN`
  * `CLOUD_SEARCH_LOCATIONS`
    * Define o caminho com os proprerties dos sistemas
    * Default: `~/properties`
  * `INSIDE_CLOUD_KEY`
    * Define a chave para realizar a encriptação das senhas nos properties
    * Default: `foM}kcGHmxB7[C9`

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
  ```properties
    spring.application.name=Inside_Name_Project
    spring.profiles.active=native
    spring.cloud.config.uri=http://localhost:8888
    spring.cloud.config.username=config
    spring.cloud.config.password=config
  ```
