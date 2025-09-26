package runners;

import com.intuit.karate.junit5.Karate;

public class LoginTestRunner {

    @Karate.Test
    public Karate runLoginTestRunner() {
        return  Karate.run("classpath:br/com/vale/features/login");
    }
}
