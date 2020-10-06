package com.czu.web;

import com.czu.domain.Medicine;
import com.czu.service.Impl.MedicineServiceImpl;
import com.czu.service.MedicineService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/findAllMedicineServlet")
public class FindAllMedicineServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        MedicineService medicineService = new MedicineServiceImpl();
        List<Medicine> medicines = medicineService.finAllMedicine();
        for (Medicine medicine : medicines) {
            System.out.println(medicine);
        }
        request.setAttribute("medicines",medicines);
        request.getRequestDispatcher("/medicineList.jsp").forward(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
