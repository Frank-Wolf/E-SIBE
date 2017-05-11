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
///imports for graphics end

import java.util.Date;
import com.itextpdf.text.Anchor;
import com.itextpdf.text.BadElementException;
import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.List;
import com.itextpdf.text.ListItem;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.Section;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.Image;
import java.io.IOException;
import java.sql.ResultSet; 
import java.sql.SQLException;

/**
 *
 * @author PsysacElrick
 */
public class Reporte_Final {
        private static String FILE;
        private static Font catFont = new Font(Font.FontFamily.TIMES_ROMAN, 17,
                        Font.BOLD);
        private static Font redFont = new Font(Font.FontFamily.TIMES_ROMAN, 12,
                        Font.NORMAL, BaseColor.RED);
        private static Font subFont = new Font(Font.FontFamily.TIMES_ROMAN, 16,
                        Font.BOLD);
        private static Font smallBold = new Font(Font.FontFamily.TIMES_ROMAN, 13,
                        Font.BOLD);
        private static Font encabezadost = new Font(Font.FontFamily.TIMES_ROMAN,12, Font.NORMAL,BaseColor.WHITE);
        private String username;//employee number, in this case, the employee number od the administrator
        LoginBean lb = new LoginBean();
        public String execute() throws Exception 
        {
            FILE = "C:\\psf\\Home\\Documents\\Reporte_de_resultados_E-SIBE.pdf";//Path where the file will be saved
            lb.getConnection();
            
            try 
                {
                        Document document = new Document();
                        PdfWriter.getInstance(document, new FileOutputStream(FILE));
                        OutputStream fos = new FileOutputStream(new File(FILE));
                        PdfWriter writer = PdfWriter.getInstance(document, fos);
                        document.open();
                        addMetaData(document);
                        addImagenes(document);
                        addEncabezado(document);
                        addTablaEvaluadoresProfesor(document);
                        addTablaNumProfesor(document);
                        int a = 0, r = 0;//a approved and r reject
                        a = getnumberA();
                        r = getnumberR();
                        
                        
                        /*Add a graphic*/
                        DefaultPieDataset defaultCategoryDataset = new DefaultPieDataset();
                        defaultCategoryDataset.setValue("Aprobados: " + a, a);
                        defaultCategoryDataset.setValue("No aprobados: "+ r, r);
                        
                        JFreeChart jFreeChart = ChartFactory.createPieChart(
                        "Actividades aprobadas y no aprobadas\n\n",  //pie chart title
                        defaultCategoryDataset, //pie chart dataset
                        false, false, false);  //pie chart> legend, tooltips and urls
                        
                        PdfContentByte pdfContentByte = writer.getDirectContent();
                        int width = 400; //width of PieChart
                        int height = 300; //height of pieChart
                        PdfTemplate pdfTemplate = pdfContentByte.createTemplate(width, height);
                        document.newPage();
                        //create graphics
                        Graphics2D graphics2d = pdfTemplate.createGraphics(width, height, new DefaultFontMapper());
           
                        //create rectangle
                        java.awt.geom.Rectangle2D rectangle2d = new java.awt.geom.Rectangle2D.Double(0, 0, width, height);
 
                        jFreeChart.draw(graphics2d, rectangle2d);
 
                        graphics2d.dispose();
                        pdfContentByte.addTemplate(pdfTemplate, 40, 500); //0, 0 will draw PIE chart on bottom left of page
                        /*Add a graphic end graphic*/
                        
                        /*Add another Graphic*/
                        int ac21 = 0, ac22 = 0, ac23 = 0, ac24 = 0, ac25 = 0, ac211 = 0, ac212 = 0;
                        ac21 = getNum2_1();
                        ac22 = getNum2_2();
                        ac23 = getNum2_3();
                        ac24 = getNum2_4();
                        ac25 = getNum2_5();
                        ac211 = getNum2_11();
                        ac212 = getNum2_12();
                        DefaultCategoryDataset defaultCategoryDataset2 = new DefaultCategoryDataset();
                        defaultCategoryDataset2.setValue(ac21, "Actividad 2.1", "2.1");
                        defaultCategoryDataset2.setValue(ac22, "Actividad 2.2", "2.2");
                        defaultCategoryDataset2.setValue(ac23, "Actividad 2.3", "2.3");
                        defaultCategoryDataset2.setValue(ac24, "Actividad 2.4", "2.4");
                        defaultCategoryDataset2.setValue(ac25, "Actividad 2.5", "2.5");
                        defaultCategoryDataset2.setValue(ac211, "Actividad 2.11", "2.11");
                        defaultCategoryDataset2.setValue(ac212, "Actividad 2.12", "2.12");
                        
                        JFreeChart jFreeChart2 = ChartFactory.createBarChart(
                        "Cantidad de registros por actividad", //title
                        "Número de actividad", // categoryAxisLabel
                        "Número de registros", //valueAxisLabel
                        defaultCategoryDataset2, //dataset
                        PlotOrientation.VERTICAL, //orientation
                        false, false, false); //legend, tooltips and urls
                        
                        PdfContentByte pdfContentByte2 = writer.getDirectContent();
                        int width2 = 600; //width of BarChart
                        int height2 = 300; //height of BarChart
                        PdfTemplate pdfTemplate2 = pdfContentByte2.createTemplate(width2, height2);
                        //document.newPage();
                        //create graphics
                        Graphics2D graphics2d2 = pdfTemplate2.createGraphics(width2, height2, new DefaultFontMapper());
           
                        //create rectangle
                        java.awt.geom.Rectangle2D rectangle2d2 = new java.awt.geom.Rectangle2D.Double(
                        0, 0, width2, height2);
 
                        jFreeChart2.draw(graphics2d2, rectangle2d2);
 
                        graphics2d2.dispose();
                        pdfContentByte2.addTemplate(pdfTemplate2, 0, 40); //0, 0 will draw BAR chart on bottom left of page
                        
                        /*Add another Graphic end*/
                        
                        lb.closeConnection();
                        document.close();
                } 
            catch (Exception e) 
                {
                        e.printStackTrace();
                        return "error";
                }
                return "success";
        }
        
        private static void addMetaData(Document document) 
        {
            document.addTitle("Reporte de Resultados Finales.");
            document.addSubject("Beca SIBE");
            document.addKeywords("COFAA, SIBE, E-SIBE, Reporte de Resultados finales");
            document.addAuthor("Comisión de Operación y Fomento de Actividades Académicas del IPN");
            document.addCreator("E-SIBE");
        }
        private static void addImagenes(Document document) throws BadElementException, IOException, DocumentException
        {
            Image cofaa= Image.getInstance("C:\\psf\\Home\\Documents\\11111\\AlumnosBEIFI\\ipn.png");
            Image IPN= Image.getInstance("C:\\psf\\Home\\Documents\\11111\\AlumnosBEIFI\\cofaa.png");
            
            cofaa.scalePercent(65);
            IPN.scalePercent(55);
            cofaa.setAbsolutePosition(480, 750);
            IPN.setAbsolutePosition(35,740);
            
            document.add(cofaa);
            document.add(IPN);
        }
        
        private void addEncabezado(Document document) throws DocumentException 
        {
            Paragraph preface = new Paragraph();
            addEmptyLine(preface, 4);
            preface.setAlignment(Element.ALIGN_CENTER);
            preface.add(new Paragraph("E-SIBE", catFont));
            
            preface.add(new Paragraph("Reporte de resultados finales de la"
                    + " beca SIBE de COFAA",smallBold));
            addEmptyLine(preface, 2);
            document.add(preface);
        }
        
        private void addTablaEvaluadoresProfesor(Document document) throws Exception
        {
            Paragraph preface = new Paragraph();
            addEmptyLine(preface, 3);    
            document.add(preface);
            document.add(tablaEvaluador_profe());
            
        }
        
        private void addTablaNumProfesor(Document document) throws Exception{
            Paragraph preface = new Paragraph();
            addEmptyLine(preface, 3);    
            document.add(preface);
            document.add(tabla_num_prof());
        }
        
         private void addEmptyLine(Paragraph paragraph, int number) {
                for (int i = 0; i < number; i++) {
                        paragraph.add(new Paragraph(" "));
                }
                
        }
         
         private PdfPTable tablaEvaluador_profe() throws Exception{
             PdfPTable tabla_evaluador = new PdfPTable(5);
             tabla_evaluador.setWidths(new int[]{2,2,3,2,3});
                PdfPCell Titulo_tabla = new PdfPCell(new Phrase("Tabla de evaluadores con los "
                        + "profesores asignados",encabezadost));
                PdfPCell evaluador = new PdfPCell(new Phrase("Número de empleado de evaluador"));
                PdfPCell profesor = new PdfPCell(new Phrase("Número de empleado de profesor"));
                PdfPCell Ruta_alm = new PdfPCell(new Phrase("Puntaje total asignado"));
                PdfPCell Puntos = new PdfPCell(new Phrase("Fecha de evaluación"));
                PdfPCell Observaciones = new PdfPCell(new Phrase("Periodo Correspondiente"));
                //PdfPCell celda=new PdfPCell();
                
                
                Titulo_tabla.setHorizontalAlignment(Element.ALIGN_CENTER);
                Titulo_tabla.setVerticalAlignment(Element.ALIGN_MIDDLE);
                Titulo_tabla.setBackgroundColor(new BaseColor(153, 0, 76));
                Titulo_tabla.setColspan(5);
                Titulo_tabla.setExtraParagraphSpace(15f);
                tabla_evaluador.addCell(Titulo_tabla);
                
                evaluador.setHorizontalAlignment(Element.ALIGN_CENTER);
                evaluador.setVerticalAlignment(Element.ALIGN_MIDDLE);
                tabla_evaluador.addCell(evaluador);

                profesor.setHorizontalAlignment(Element.ALIGN_CENTER);
                profesor.setVerticalAlignment(Element.ALIGN_MIDDLE);
                tabla_evaluador.addCell(profesor);

                Ruta_alm.setHorizontalAlignment(Element.ALIGN_CENTER);
                Ruta_alm.setVerticalAlignment(Element.ALIGN_MIDDLE);
                tabla_evaluador.addCell(Ruta_alm);

                Puntos.setHorizontalAlignment(Element.ALIGN_CENTER);
                Puntos.setVerticalAlignment(Element.ALIGN_MIDDLE);
                tabla_evaluador.addCell(Puntos);

                Observaciones.setHorizontalAlignment(Element.ALIGN_CENTER);
                Observaciones.setVerticalAlignment(Element.ALIGN_MIDDLE);
                tabla_evaluador.addCell(Observaciones);

                /*Aqui van las consultas de las Actividades del profesor*/
                ResultSet rb = lb.executeQuery("SELECT * FROM evaluador_evalua_profesor");
                while(rb.next()){
                    tabla_evaluador.addCell(rb.getString("id_usuario_ev"));
                    tabla_evaluador.addCell(rb.getString("id_usuario_prof"));//Add the type of every type pub
                    tabla_evaluador.addCell(rb.getString("puntaje_final"));
                    tabla_evaluador.addCell(rb.getString("fecha_ev"));
                    tabla_evaluador.addCell(rb.getString("periodo"));
                }
                
             
             return tabla_evaluador;
         
         }
         
         private PdfPTable tabla_num_prof() throws Exception{
             PdfPTable tabla_num = new PdfPTable(2);
             tabla_num.setWidths(new int[]{2,2});
                PdfPCell Titulo_tabla = new PdfPCell(new Phrase("Número total de evaluadores y profesores "
                        + "participantes", encabezadost));
                PdfPCell evaluador = new PdfPCell(new Phrase("Número de evaluadores"));
                PdfPCell profesor = new PdfPCell(new Phrase("Número de profesores"));
                
                
                Titulo_tabla.setHorizontalAlignment(Element.ALIGN_CENTER);
                Titulo_tabla.setVerticalAlignment(Element.ALIGN_MIDDLE);
                Titulo_tabla.setBackgroundColor(new BaseColor(153, 0, 76));
                Titulo_tabla.setColspan(5);
                Titulo_tabla.setExtraParagraphSpace(15f);
                tabla_num.addCell(Titulo_tabla);
                
                evaluador.setHorizontalAlignment(Element.ALIGN_CENTER);
                evaluador.setVerticalAlignment(Element.ALIGN_MIDDLE);
                tabla_num.addCell(evaluador);

                profesor.setHorizontalAlignment(Element.ALIGN_CENTER);
                profesor.setVerticalAlignment(Element.ALIGN_MIDDLE);
                tabla_num.addCell(profesor);

                /*Aqui van las consultas de las Actividades del profesor*/
                int i = 0;
                ResultSet re = lb.executeQuery("SELECT * FROM evaluador"), rp;
                String numberAsString;// = Integer.toString(number);
                while(re.next()){
                    i++;
                }
                //System.out.println(i);
                numberAsString = Integer.toString(i);
                tabla_num.addCell(numberAsString);
                i = 0;
                rp = lb.executeQuery("SELECT * FROM profesor");
                while(rp.next()){
                   i++;
                }
                //System.out.println(numberAsString);
                numberAsString = Integer.toString(i);
                tabla_num.addCell(numberAsString);
             return tabla_num;
         }
         
         private int getnumberA() throws SQLException{
             ResultSet ra, rp, re, rpro, rob, rtt, rpar_plan;
             int a = 0, b = 12, c = 11, d = 0, e = 0, f = 0, g = 0, suma_ap = 0;
             //System.out.println(b);
             ra = lb.executeQuery("SELECT COUNT(*) FROM profesor_tiene_proyecto WHERE aceptado_alumno = 1"/*AND 
             periodo = (same as professor)*/);
             if(ra.next())
                 a = ra.getInt(1);
             
             rp = lb.executeQuery("SELECT COUNT(*) FROM profesor_tiene_pub WHERE aceptado = 1"/*AND periodo = (same as profesor)*/);
             if(rp.next())
                 b = rp.getInt(1);
             
             re = lb.executeQuery("SELECT COUNT(*) FROM profesor_participa_ev WHERE aceptado = 1");
             if(re.next())
                 c = re.getInt(1);
             //System.out.println(c);
             rpro = lb.executeQuery("SELECT COUNT(*) FROM profesor_tiene_proyecto WHERE aceptado = 1");
             if(rpro.next())
                 d = rpro.getInt(1);
             
             rob = lb.executeQuery("SELECT COUNT(*) FROM profesor_tiene_obra WHERE aceptado = 1");
             if(rob.next())
                 e = rob.getInt(1);
             
             rtt = lb.executeQuery("SELECT COUNT(*) FROM profesor_tiene_tt WHERE aceptado = 1");
             if(rtt.next())
                 f = rtt.getInt(1);
             
             rpar_plan = lb.executeQuery("SELECT COUNT(*) FROM profesor_participa_en_plan WHERE aceptado = 1");
             if(rpar_plan.next())
                 g = rpar_plan.getInt(1);
             suma_ap = a + b + c + d + e + f + g;
             //System.out.println(a + b + c + d + e + f + g);
             return suma_ap;
            }
        
         private int getnumberR() throws SQLException{
             ResultSet ra, rp, re, rpro, rob, rtt, rpar_plan;
             int a = 0, b = 12, c = 11, d = 0, e = 0, f = 0, g = 0, suma_ap = 0;
             //System.out.println(b);
             ra = lb.executeQuery("SELECT COUNT(*) FROM profesor_tiene_proyecto WHERE aceptado_alumno = 0"/*AND 
             periodo = (same as professor)*/);
             if(ra.next())
                 a = ra.getInt(1);
             
             rp = lb.executeQuery("SELECT COUNT(*) FROM profesor_tiene_pub WHERE aceptado = 0"/*AND periodo = (same as profesor)*/);
             if(rp.next())
                 b = rp.getInt(1);
             
             re = lb.executeQuery("SELECT COUNT(*) FROM profesor_participa_ev WHERE aceptado = 0");
             if(re.next())
                 c = re.getInt(1);
             //System.out.println(c);
             rpro = lb.executeQuery("SELECT COUNT(*) FROM profesor_tiene_proyecto WHERE aceptado = 0");
             if(rpro.next())
                 d = rpro.getInt(1);
             
             rob = lb.executeQuery("SELECT COUNT(*) FROM profesor_tiene_obra WHERE aceptado = 0");
             if(rob.next())
                 e = rob.getInt(1);
             
             rtt = lb.executeQuery("SELECT COUNT(*) FROM profesor_tiene_tt WHERE aceptado = 0");
             if(rtt.next())
                 f = rtt.getInt(1);
             
             rpar_plan = lb.executeQuery("SELECT COUNT(*) FROM profesor_participa_en_plan WHERE aceptado = 0");
             if(rpar_plan.next())
                 g = rpar_plan.getInt(1);
             suma_ap = a + b + c + d + e + f + g;
             System.out.println(a + b + c + d + e + f + g);
             return suma_ap;
             
            }
         
         private int getNum2_1() throws SQLException{
             ResultSet rs;
             int i = 0;
             rs = lb.executeQuery("SELECT COUNT(*) FROM profesor_tiene_proyecto WHERE aceptado_alumno = 0 OR "
                     + "aceptado_alumno = 1" /*AND periodo = same as professor*/);
             if(rs.next())
                 i = rs.getInt(1);    
             return i;
         }
         

         private int getNum2_2() throws SQLException{
             ResultSet rs;
             int i = 0;
             rs = lb.executeQuery("SELECT COUNT(*) FROM profesor_tiene_pub WHERE aceptado = 1 OR aceptado = 0");
             if(rs.next())
                 i = rs.getInt(1);    
             return i;
         }
         
         private int getNum2_3() throws SQLException{
             ResultSet rs;
             int i = 0;
             rs = lb.executeQuery("SELECT COUNT(*) FROM profesor_participa_ev WHERE aceptado = 0 OR aceptado = 1");
             if(rs.next())
                 i = rs.getInt(1);    
             return i;
         }
         
         private int getNum2_4() throws SQLException{
             ResultSet rs;
             int i = 0;
             rs = lb.executeQuery("SELECT COUNT(*) FROM profesor_tiene_proyecto WHERE aceptado = 0 OR aceptado = 1");
             if(rs.next())
                 i = rs.getInt(1);    
             return i;
         }
         
         private int getNum2_5() throws SQLException{
             ResultSet rs;
             int i = 0;
             rs = lb.executeQuery("SELECT COUNT(*) FROM profesor_tiene_obra WHERE aceptado = 0 OR aceptado = 1");
             if(rs.next())
                 i = rs.getInt(1);    
             return i;
         }
         
         private int getNum2_11() throws SQLException{
             ResultSet rs;
             int i = 0;
             rs = lb.executeQuery("SELECT COUNT(*) FROM profesor_tiene_tt WHERE aceptado = 0 OR aceptado = 1");
             if(rs.next())
                 i = rs.getInt(1);    
             return i;
         }
         
         private int getNum2_12() throws SQLException{
             ResultSet rs;
             int i = 0;
             rs = lb.executeQuery("SELECT COUNT(*) FROM profesor_participa_en_plan WHERE aceptado = 0 OR aceptado = 1");
             if(rs.next())
                 i = rs.getInt(1);    
             return i;
         }
    
        public String getUsername() {
            return username;
        }

        public void setUsername(String username) {
            this.username = username;
        }
   
    
}
