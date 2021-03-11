public class assign {

    public static void main(String args[]) {
        int a = 5;
        int b = ++a + ++a + ++a;
        int a1 = 5;
        int c = a1++ + a1++ + a1++;
        System.out.println("value a is " + a + " , value b is " + b);
        System.out.println("value a1 is " + a1 + ", value c is " + c);
        System.out.println("++a: increment 1st, then add");
        System.out.println("a++: assign 1st, then increment");
    }

}
