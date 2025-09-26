package runners;

import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;

public class AllTestRunner {

    @Test
    public void runAllTestRunner() {
        Runner.Builder builder = new Runner.Builder();
        builder.path("classpath:br/com/vale");
//        builder.tags("@smoke");
        Results result = builder.parallel(5);
        Assertions.assertEquals(0, result.getFailCount());
    }
}
