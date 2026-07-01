import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.*;

public class AppTest {

    @Test
    public void testAddition() {
        int result = App.add(2, 2);
        assertEquals(4, result);
    }

    @Test
    public void testAnotherAddition() {
        assertEquals(5, App.add(2, 3));
    }
}