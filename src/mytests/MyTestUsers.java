package mytests;

import db.DbUsersOperations;
import entity.User;

import java.util.List;

public class MyTestUsers {

    public static void main(String[] args) {

    new MyTestUsers().testSelect(false);

    }

    private void testInsert () {
        User u = new User("ghita", "pwd", true, true);
        User u1 = new User("mariuca", "pwd", true, true);

        User um = new User("emag", "pwd", true, false);
        User um1 = new User("lidl", "pwd", true, false);

        DbUsersOperations db = new DbUsersOperations();
        db.insert(u);
        db.insert(u1);
        db.insert(um);
        db.insert(um1);
    }
    private void testSelect(boolean b) {

        DbUsersOperations db = new DbUsersOperations();
        List<User> lu = db.readAllUsers(b);

        for(User u: lu) {
            System.out.println(u);
        }


    }
}
