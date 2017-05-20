/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package PDF;
import java.awt.Graphics2D;
import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStream;
 
import org.jfree.chart.ChartFactory;
import org.jfree.chart.JFreeChart;
import org.jfree.data.general.DefaultPieDataset;
import org.jfree.chart.plot.PlotOrientation;
import org.jfree.data.category.DefaultCategoryDataset;
 
import com.itextpdf.text.pdf.DefaultFontMapper;
import com.itextpdf.text.Document;
import com.itextpdf.text.pdf.PdfContentByte;
import com.itextpdf.text.pdf.PdfTemplate;
import com.itextpdf.text.pdf.PdfWriter;

public class Genera_Reporte_final {
    public String execute() throws Exception {
 
           DefaultPieDataset defaultCategoryDataset = new DefaultPieDataset();
           defaultCategoryDataset.setValue("Linux", 8);
           defaultCategoryDataset.setValue("Mac OS", 15);
           defaultCategoryDataset.setValue("Windows", 75);
           defaultCategoryDataset.setValue("Unix", 2);
           
           DefaultCategoryDataset defaultCategoryDataset2 = new DefaultCategoryDataset();
           defaultCategoryDataset2.setValue(190, "LaptopUsers", "1995");
           defaultCategoryDataset2.setValue(205, "LaptopUsers", "2000");
           defaultCategoryDataset2.setValue(300, "LaptopUsers", "2005");
           defaultCategoryDataset2.setValue(350, "LaptopUsers", "2010");
           defaultCategoryDataset2.setValue(390, "LaptopUsers", "2015");
 
           JFreeChart jFreeChart = ChartFactory.createPieChart(
                        "Operating System users",  //pie chart title
                        defaultCategoryDataset, //pie chart dataset
                        false, false, false);  //pie chart> legend, tooltips and urls
           
           JFreeChart jFreeChart2 = ChartFactory.createBarChart(
                        "LaptopUsers BarChart", //title
                        "Year", // categoryAxisLabel
                        "LaptopUsers", //valueAxisLabel
                        defaultCategoryDataset2, //dataset
                        PlotOrientation.VERTICAL, //orientation
                        false, false, false); //legend, tooltips and urls
 
           String pdfFilePath = "C:\\psf\\Home\\Documents\\First_report.pdf";
           OutputStream fos = new FileOutputStream(new File(pdfFilePath));
           Document document = new Document();
           PdfWriter writer = PdfWriter.getInstance(document, fos);
 
           document.open();
           
           PdfContentByte pdfContentByte = writer.getDirectContent();
           int width = 400; //width of PieChart
           int height = 300; //height of pieChart
           PdfTemplate pdfTemplate = pdfContentByte.createTemplate(width, height);
           
           //create graphics
           Graphics2D graphics2d = pdfTemplate.createGraphics(width, height, new DefaultFontMapper());
           
           //create rectangle
           java.awt.geom.Rectangle2D rectangle2d = new java.awt.geom.Rectangle2D.Double(
                        0, 0, width, height);
 
           jFreeChart.draw(graphics2d, rectangle2d);
 
           graphics2d.dispose();
           pdfContentByte.addTemplate(pdfTemplate, 40, 500); //0, 0 will draw PIE chart on bottom left of page
 
           //document.close();
           System.out.println("PDF created in >> " + pdfFilePath);
          
 
           //document2.open();
           
           PdfContentByte pdfContentByte2 = writer.getDirectContent();
           int width2 = 400; //width of BarChart
           int height2 = 300; //height of BarChart
           PdfTemplate pdfTemplate2 = pdfContentByte2.createTemplate(width2, height2);
           document.newPage();
           //create graphics
           Graphics2D graphics2d2 = pdfTemplate2.createGraphics(width2, height2, new DefaultFontMapper());
           
           //create rectangle
           java.awt.geom.Rectangle2D rectangle2d2 = new java.awt.geom.Rectangle2D.Double(
                        0, 0, width2, height2);
 
           jFreeChart2.draw(graphics2d2, rectangle2d2);
 
           graphics2d2.dispose();
           pdfContentByte2.addTemplate(pdfTemplate2, 40, 500); //0, 0 will draw BAR chart on bottom left of page
 
           document.close();
           System.out.println("PDF created in >> " + pdfFilePath);
           
        return "success";
 
    }
 
}

/*public class Genera_Reporte_final {
    public String execute() throws Exception {
           
           DefaultCategoryDataset defaultCategoryDataset2 = new DefaultCategoryDataset();
           defaultCategoryDataset2.setValue(190, "LaptopUsers", "1995");
           defaultCategoryDataset2.setValue(205, "LaptopUsers", "2000");
           defaultCategoryDataset2.setValue(300, "LaptopUsers", "2005");
           defaultCategoryDataset2.setValue(350, "LaptopUsers", "2010");
           defaultCategoryDataset2.setValue(390, "LaptopUsers", "2015");
           
           JFreeChart jFreeChart2 = ChartFactory.createBarChart(
                        "LaptopUsers BarChart", //title
                        "Year", // categoryAxisLabel
                        "LaptopUsers", //valueAxisLabel
                        defaultCategoryDataset2, //dataset
                        PlotOrientation.VERTICAL, //orientation
                        false, false, false); //legend, tooltips and urls
           
 
           String pdfFilePath2 = "C:\\psf\\Home\\Documents\\First_report.pdf";
           OutputStream fos2 = new FileOutputStream(new File(pdfFilePath2));
           Document document2 = new Document();
           PdfWriter writer2 = PdfWriter.getInstance(document2, fos2);
 
           document2.open();
           
           PdfContentByte pdfContentByte2 = writer2.getDirectContent();
           int width2 = 400; //width of BarChart
           int height2 = 300; //height of BarChart
           PdfTemplate pdfTemplate2 = pdfContentByte2.createTemplate(width2, height2);
           
           //create graphics
           Graphics2D graphics2d2 = pdfTemplate2.createGraphics(width2, height2, new DefaultFontMapper());
           
           //create rectangle
           java.awt.geom.Rectangle2D rectangle2d2 = new java.awt.geom.Rectangle2D.Double(
                        0, 0, width2, height2);
 
           jFreeChart2.draw(graphics2d2, rectangle2d2);
 
           graphics2d2.dispose();
           pdfContentByte2.addTemplate(pdfTemplate2, 40, 500); //0, 0 will draw BAR chart on bottom left of page
 
           document2.close();
           System.out.println("PDF created in >> " + pdfFilePath2);
           return "success";
    }
}*/
