package calculations;

public class RandomNumbers {

    public static int generate() {

        int random = (int) (Math.random() * 9000) + 1000;
        return random;
    }

}
