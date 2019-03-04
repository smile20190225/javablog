import java.io.File;
import java.io.IOException;

public class TestPath {
    public static void main(String[] args) {
        File directory = new File("");// 参数为空
        String courseFile = null;
        try {
            courseFile = directory.getCanonicalPath();
        } catch (IOException e) {
            e.printStackTrace();
        }
        System.out.println(courseFile);
    }
}
