# 🥋 Karate Framework API Automation

![Karate](https://img.shields.io/badge/Karate-1.1.0-green)
![Java](https://img.shields.io/badge/Java-11+-blue)
![Maven](https://img.shields.io/badge/Maven-3.9+-red)
![Test Status](https://img.shields.io/badge/Tests-Passing-brightgreen)

Modern API automation framework using **Karate Framework 1.1.0** with **Page Object Model (POM)** pattern for testing automation exercise APIs. Features comprehensive test coverage, multiple execution strategies, and detailed HTML reporting.

## 🌟 Key Features

- ✅ **Karate Framework 1.1.0** with GraalVM JavaScript engine support
- ✅ **Page Object Model (POM)** pattern for maintainable test structure
- ✅ **Multiple Test Runners** for different execution scenarios
- ✅ **Tag-based Test Execution** for targeted testing
- ✅ **Comprehensive API Validation** (status, structure, data types)
- ✅ **Negative Testing** for error scenario coverage
- ✅ **Rich HTML Reports** with detailed request/response logs
- ✅ **JUnit 5 Integration** for modern testing framework
- ✅ **Environment Configuration** support

## 📁 Project Structure

```
karateFramework-API-automation/
├── src/
│   └── test/
│       └── java/
│           ├── br.com.vale/
│           │   ├── feature/
│           │   │   └── login                  
│           │   │       └── postLogin.feature     # Login API test scenarios
│           │   │   └── users                 
│           │   │       └── deleteUsersId.feature # Delete users ID API test scenarios
│           │   │       └── getUsers.feature      # Get all users API test scenarios
│           │   │       └── getUsersId.feature    # Get ID users API test scenarios
│           │   │       └── postUsers.feature     # Post users API test scenarios
│           │   │       └── putUsersId.feature    # Put ID users API test scenarios
│           │   ├── support/                      # Utility and functions
│           │   │   └── config    
│           │   │   └── utils         
│           │   ├── runners/
│           │   │   ├── AllTestRunner.java         # All API tests runner
│           │   │   ├── LoginTestRunner.java       # Login tests runner
│           │   │   ├── UsersTestRunner.java       # Users Stores tests runner
│           └── karate-config.js                    # Global configuration
├── target/
│   └── karate-reports/                             # Generated test reports
├── pom.xml                                         # Maven configuration
└── README.md                                       # Test data documentation
```

## 🌐 APIs Under Test: ServeRest  2.29.7

### 1. Login
- **Endpoint**: `https://serverest.dev/login`
- **Method**: `POST`
- **Expected Status Code**: `200` with JSON
- **Test Coverage**: Success scenarios

#### Sample Response: Login realizado com sucesso

```json
{
  "message": "Login realizado com sucesso",
  "authorization": "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6ImZ1bGFub0BxYS5jb20iLCJwYXNzd29yZCI6InRlc3RlIiwiaWF0IjoxNTg5NzU4NzQ2LCJleHAiOjE1ODk3Njg3NDZ9.B6TASHV8k9xBerz4NSeFBlAZGSDhZlqESt767M0567I"
}
```

### 2. Usuários
- **Endpoint**: `https://serverest.dev/usuarios`
- **Method**: `GET`
- **Expected Status Code**: `200` with JSON
- **Test Coverage**: Success scenarios

#### Sample Response: Lista de usuários
```json
{
  "quantidade": 1,
  "usuarios": [
    {
      "nome": "Fulano da Silva",
      "email": "beltrano@qa.com.br",
      "password": "teste",
      "administrador": "true",
      "_id": "0uxuPY0cbmQhpEz1"
    }
  ]
}
```
- **Endpoint**: `https://serverest.dev/usuarios`
- **Method**: `POST`
- **Expected Status Code**: `201` with JSON
- **Test Coverage**: Success scenarios

#### Sample Response: Cadastro com sucesso

```json
{
  "message": "Cadastro realizado com sucesso",
  "_id": "jogfODIlXsqxNFS2"
}
```

- **Endpoint**: `https://serverest.dev/usuarios/0uxuPY0cbmQhpEz1`
- **Method**: `GET`
- **Expected Status Code**: `200` with JSON
- **Test Coverage**: Success scenarios

#### Sample Response: Usuário encontrado

```json
{
  "nome": "Fulano da Silva",
  "email": "beltrano@qa.com.br",
  "password": "teste",
  "administrador": "true",
  "_id": "0uxuPY0cbmQhpEz1"
}
```

- **Endpoint**: `https://serverest.dev/usuarios/1PYryuVUK34rdZgp`
- **Method**: `DELETE`
- **Expected Status Code**: `200` with JSON
- **Test Coverage**: Success scenarios

#### Sample Response: Registro excluído com sucesso | Nenhum registro excluído

```json
{
  "message": "Registro excluído com sucesso | Nenhum registro excluído"
}
```
- **Endpoint**: `ttps://serverest.dev/usuarios/0uxuPY0cbmQhpEz1`
- **Method**: `PUT`
- **Expected Status Code**: `200` with JSON
- **Test Coverage**: Success scenarios

#### Sample Response: Alterado com sucesso

```json
{
  "message": "Registro alterado com sucesso"
}
```
## 🏷️ Test Categories & Tags

| Tag | Purpose | Description |
|-----|---------|-------------|
| `@smoke` | **Critical Tests** | Essential scenarios for basic functionality |
| `@regression` | **Full Coverage** | Comprehensive test suite for all features |
| `@negative` | **Error Testing** | Invalid inputs and error scenario validation |

## ⚡ Quick Start

### Prerequisites

- ☑️ **Java 11+** - Required for Karate 1.1.0
- ☑️ **Maven 3.9+** - Build and dependency management
- ☑️ **IDE** (IntelliJ IDEA, VS Code, Eclipse) - For development

### Installation

1. **Clone the repository**
   ```bash
   git clone ...
   cd karateFramework-API-automation
   ```

2. **Install dependencies**
   ```bash
   mvn clean compile test-compile
   ```

3. **Verify setup**
   ```bash
   mvn test
   ```

## 🚀 Running Tests

### Option 1: Maven Commands

#### Run All Tests
```bash
mvn test
```

#### Run Specific Test Runners
```bash
# Run smoke tests only (critical scenarios)
mvn test -Dtest=SmokeTestRunner

# Run regression tests only (full coverage)
mvn test -Dtest=RegressionTestRunner

# Run all API tests (comprehensive)
mvn test -Dtest=ApiTestRunner
```

#### Run by Tags (Karate Options)
```bash
# Run smoke tests
mvn test -Dkarate.options="--tags @smoke"

# Run regression tests
mvn test -Dkarate.options="--tags @regression"

# Run negative tests only
mvn test -Dkarate.options="--tags @negative"

# Exclude specific tags
```

### Option 2: Direct Java Execution

Run tests directly using the SimpleKarateRunner:
```bash
# Compile first
mvn clean compile test-compile

# Run with Java (includes classpath dependencies)
mvn exec:java -Dexec.mainClass="api.runners.SimpleKarateRunner"
```

### Option 3: IDE Execution

- **IntelliJ IDEA**: Right-click on any runner class → Run
- **VS Code**: Use Java Test Runner extension
- **Eclipse**: Right-click on runner → Run As → JUnit Test

## 📊 Test Results & Reporting

### Console Output
Tests:
```
======================================================
elapsed:   5,59 | threads:    5 | thread time: 9,65 
features:     2 | skipped:    0 | efficiency: 0,35
scenarios:    6 | passed:     6 | failed: 0
======================================================
```

### HTML Reports
After execution, detailed reports are generated in:
```
target/karate-reports/
├── karate-summary.html                           # Main report dashboard
├── br.com.vale.features.login.PostLogin.html     # Login API detailed report
├── br.com.vale.features.users.getUsers.html      # Users API detailed report
├── br.com.vale.features.users.postUsers.html     # Users API detailed report
├── br.com.vale.features.users.getUsersId.html    # Users API detailed report
├── br.com.vale.features.users.deleteUsersId.html # Users API detailed report
├── br.com.vale.features.users.putUsersId.html    # Users API detailed report
└── *.karate-json.txt            # Raw JSON results
```

**Open `karate-summary.html` in your browser for:**
- 📈 Test execution statistics
- 🔍 Request/Response details
- ⏱️ Performance metrics
- 🐛 Failure analysis
- 📋 Step-by-step execution logs

## ⚙️ Configuration

### Environment Configuration
Base URL and global settings are configured in `karate-config.js`:

```javascript
function fn() {
    var env = karate.env; // get system property 'karate.env'

    var config = { env: env }
    var headers = {"cache-control": "no-cache"}
    karate.configure('ssl', true)
    if (!env) {env = 'dev'; }
    switch(env){
        case 'uat':
            config = karate.read('classpath:br/com/vale/support/config/basicURL.yaml')['uat']
            break;
        case 'qa':
            config = karate.read('classpath:br/com/vale/support/config/basicURL.yaml')['qa']
            break;
        case 'dev':
            config = karate.read('classpath:br/com/vale/support/config/basicURL.yaml')['dev']
            break;
        default:

    }

    karate.log('karate.env system property was:', env);
    karate.configure('headers', headers);
    karate.configure('retry',  {count:10, interval: 5000});
    return config;
}
```

### Maven Configuration
Key dependencies and versions in `pom.xml`:

```xml
    <properties>
    <project.build.sourceEncoding>UTF-8</project.build.sourceEncoding>
    <java.version>1.8</java.version>
    <maven.compiler.version>3.8.1</maven.compiler.version>
    <maven.surefire.version>2.22.2</maven.surefire.version>
    <karate.version>1.1.0</karate.version>
</properties>    
```

## 🏗️ Project Architecture

### Framework Design Principles

1. **Page Object Model (POM)**
    - Separates test logic from test data
    - Improves code reusability and maintainability
    - Organized feature files by API endpoints

2. **Tag-Based Execution**
    - Flexible test execution strategies
    - Easy integration with CI/CD pipelines
    - Selective test running capability

3. **Multiple Test Runners**
    - **ApiTestRunner**: Executes all API tests
    - **SmokeTestRunner**: Critical functionality only
    - **RegressionTestRunner**: Comprehensive test coverage
    - **SimpleKarateRunner**: Direct execution with detailed logging

### Test Scenario Structure

Each feature file follows this pattern:
```gherkin
Feature: API Name Tests

Background:
  * url baseUrl

@smoke @api-name
Scenario: Positive test scenario
  Given path 'endpoint'
  When method GET
  Then status 200
  And match response.field == 'expected'

@negative @api-name  
Scenario: Negative test scenario
  Given path 'invalid-endpoint'
  When method GET
  Then status 404
```

## 🔧 Development Guide

### Adding New Tests

1. **Create Feature File**
   ```bash
   src/test/java/api/new-endpoint/NewEndpoint.feature
   ```

2. **Follow Naming Convention**
    - Use descriptive scenario names
    - Add appropriate tags (@smoke, @regression, @negative)
    - Include API endpoint name in tags

3. **Add to Test Runner**
   ```java
   @Karate.Test
   Karate testNewEndpoint() {
       return Karate.run("classpath:api/new-endpoint").tags("~@ignore");
   }
   ```

### Best Practices

- ✅ Use meaningful scenario descriptions
- ✅ Add both positive and negative test cases
- ✅ Validate response structure and data types
- ✅ Include proper tags for categorization
- ✅ Follow consistent naming conventions
- ✅ Add comments for complex validations

## 🚨 Troubleshooting

### Common Issues

| Issue | Solution |
|-------|----------|
| Java version mismatch | Ensure Java 11+ is installed and JAVA_HOME is set |
| Maven build failures | Run `mvn clean compile test-compile` |
| Test discovery issues | Check JUnit 5 annotations and runner configuration |
| Karate script errors | Verify JavaScript syntax in feature files |
| Network timeouts | Increase timeout in karate-config.js |

### Debug Mode
Run tests with debug logging:
```bash
mvn test -Dkarate.options="--debug"
```

## 📈 CI/CD Integration

### GitHub Actions Example
```yaml
name: API Tests
on: [push, pull_request]
jobs:
  test:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      - uses: actions/setup-java@v3
        with:
          java-version: '11'
      - run: mvn test
      - uses: actions/upload-artifact@v3
        with:
          name: test-reports
          path: target/karate-reports/
```
## 📄 License

This project is created for educational and testing purposes. No license restrictions apply.

## 🔗 Links

- [Karate Framework Documentation](https://github.com/karatelabs/karate)
- [Automation Exercise API](https://automationexercise.com/api_list)
- [GitHub Repository](https://github.com/adityadwic/karateFramework-API-automation)

---

**Made with ❤️ using Karate Framework 1.1.0**