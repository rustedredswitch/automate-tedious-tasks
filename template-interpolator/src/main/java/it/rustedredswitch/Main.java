package it.rustedredswitch;

public class Main {
    public static void main(String[] args) {
        String[] listOfParams = {"Gino", "Pino"};
        System.out.println(interpolate(listOfParams));
    }

    private static String interpolate(String[] params) {
        String result = "";
        for (String p : params) {
            result = result.concat("Ciao " + p + "\n");
        }
        return result;
    }
}