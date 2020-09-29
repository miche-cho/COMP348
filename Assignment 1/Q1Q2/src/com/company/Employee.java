package com.company;
import java.math.BigDecimal;

// enum for salary ranges
enum SalaryRange {
    BELOW_25000,
    BETWEEN_25000_40000,
    BETWEEN_40000_70000,
    ABOVE_70000
}

public class Employee implements Person {
    String id;
    String lName;
    String fName;
    String income;
    BigDecimal salary;


    public String getUserID() {
        return id;
    }

    public String getLastName() {
        return lName;
    }

    public String getFirstName() {
        return fName;
    }

    public String getFullName() {
        return this.lName + " " + this.fName;
    }

    // return salary as BigDecimal
    public BigDecimal getSalary() {
        this.salary = BigDecimal.valueOf(Double.parseDouble(this.income));
        //  System.out.println("salary is " + salary);
        return salary;
    }

    // return string with values
    @Override
    public String toString() {
        return "Employee{" +
                "id='" + id + '\'' +
                ", lName='" + lName + '\'' +
                ", fName='" + fName + '\'' +
                ", salary=" + getSalary() +
                '}';
    }

    // take lines from employee.txt and splice into array with , as delimiter
    static Employee parse(String input) {
        String staffInfo[] = input.split(",");
        Employee e = new Employee();
        e.id = staffInfo[0];
        e.fName = staffInfo[1];
        e.lName = staffInfo[2];
        e.income = staffInfo[3];
        return e;
    }

    // taking salary and assigning to enum to make summarizing salary easier
    public SalaryRange getSalaryRange() {
        double result = Double.parseDouble(income);
        if (result < 25000) {
            return SalaryRange.BELOW_25000;
        } else if (result >= 25000 && result < 40000) {
            return SalaryRange.BETWEEN_25000_40000;
        } else if (result >= 40000 && result < 70000) {
            return SalaryRange.BETWEEN_40000_70000;
        } else {
            return SalaryRange.ABOVE_70000;
        }
    }
}
