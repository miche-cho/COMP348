package com.company;
import java.io.*;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.*;
import java.util.stream.Stream;
import java.util.stream.Collectors;
import java.util.DoubleSummaryStatistics;

import static java.util.stream.Collectors.groupingBy;
import static java.util.stream.Collectors.summarizingDouble;



public class Main {

    public static void main(String args[]) {
        String cwd = System.getProperty("user.dir");
        String fileName = cwd + "\\src\\employee.txt";
        List<Employee> list = new ArrayList<Employee>();

        // try with resources
        try (Stream<String> stream = Files.lines(Paths.get(fileName))) {
            list = stream
                    .map((value) -> Employee.parse(value))
                    .collect(Collectors.toList());
            Comparator<Employee> employeeCompName = Comparator.comparing(Employee::getFullName);
            Comparator<Employee> employeeCompId = Comparator.comparing(Employee::getUserID);

            // sort by full name (last and first name)
            list.sort(employeeCompName);
            System.out.println("\nSort by Employee Last and First Name");
            list.stream().forEach(System.out::println);
            System.out.println("\nSort by Employee ID");

            // sort by id
            list.sort(employeeCompId);
            list.stream().forEach(System.out::println);
            System.out.println();

            // map summary of employee salary by ranges
            Map<SalaryRange, DoubleSummaryStatistics> employeeSalary = list.stream()
                    .collect(groupingBy(Employee::getSalaryRange, summarizingDouble(e -> e.getSalary().doubleValue())));
            System.out.println("Summary of Employee Salary info By Group \n" + employeeSalary);
            System.out.println();

            // total count and avg salary
            DoubleSummaryStatistics d = list.stream().collect(summarizingDouble(e -> e.getSalary().doubleValue()));
            System.out.println("Total Count and Average Salary \n" + d);

        } catch (FileNotFoundException e) {
            System.out.println("unable to open file " + fileName);
        } catch (IOException ex) {
            System.out.println(
                    "Error reading file '"
                            + fileName + "'");
        }
    }
}
