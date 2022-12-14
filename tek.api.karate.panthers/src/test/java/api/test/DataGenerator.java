package api.test;
import java.text.SimpleDateFormat;
import java.util.Date;
import com.github.javafaker.Faker;
public class DataGenerator {
     
	public static String getEmail() {
        Faker faker = new Faker();
        String email = faker.name().firstName()+faker.name().lastName()+"@gmail.com";
        return email;
    }
    public static String getFirstName() {
        Faker faker = new Faker();
        String firstName = faker.name().firstName();
        return firstName;
    }
    public static String getLastName() {
        Faker faker = new Faker();
        String lastName = faker.name().lastName();
        return lastName;
    }
    public static String getDob() {
        Faker faker = new Faker();
        Date date = faker.date().birthday();
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        return format.format(date);
    }
    public static String getTitle() {
        Faker faker = new Faker();
        String title = faker.name().prefix().toUpperCase();
        return title;
    }
    public static String getGender() {
        Faker faker = new Faker();
        String gender = faker.dog().gender().toUpperCase();
        return gender;
    }
    public static String getJob() {
        Faker faker = new Faker();
        String job = faker.job().position();
        return job;
    }
    public static String getMaritalstatus() {
        Faker faker = new Faker();
        String maritalStatus = faker.demographic() .maritalStatus() .toUpperCase();
        return maritalStatus;
        }

	
	
	
}