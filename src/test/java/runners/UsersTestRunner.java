package runners;

import com.intuit.karate.junit5.Karate;

public class UsersTestRunner {

    @Karate.Test
    public Karate runUsersTestRunner() {
        return  Karate.run("classpath:br/com/vale/features/users/postUsers.feature");
    }
}
