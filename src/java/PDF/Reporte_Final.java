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
 
//import com.itextpdf.text.pdf.DefaultFontMapper;
import com.itextpdf.text.pdf.PdfContentByte;
import com.itextpdf.text.pdf.PdfTemplate;
import com.itextpdf.text.pdf.PdfWriter;
///imports for graphics end

import com.itextpdf.text.BadElementException;
import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Phrase;
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
        public  String execute() throws Exception 
        {
            //FILE = "C:\\psf\\Home\\Documents\\Reporte_de_resultados_E-SIBE.pdf";//Path where the file will be saved
            //FILE = ".\\Usuarios\\Reporte_de_resultados_E-SIBE.pdf";
            FILE = ".\\bin\\apache-tomcat-8.0.43\\webapps\\Usuarios\\Reporte_de_resultados_E-SIBE.pdf";
            //.\\bin\\apache-tomcat-8.0.43\\webapps\\Usuarios\\Reporte_de_resultados_E-SIBE.pdf
            lb.getConnection();
            
            try 
                {
                        Document document = new Document();
                        PdfWriter.getInstance(document, new FileOutputStream(FILE));
                        OutputStream fos = new FileOutputStream(new File(FILE));
                        PdfWriter writer = PdfWriter.getInstance(document, fos);
                        document.open();
                        addMetaData(document);
                        //addImagenes(document);
                        addEncabezado(document);
                        
                        int a = 0, r = 0;//a approved and r reject
                        a = getnumberA();
                        r = getnumberR();
                        
                        //document.newPage();
                        /*Add a graphic*/
                        /*DefaultPieDataset defaultCategoryDataset = new DefaultPieDataset();
                        defaultCategoryDataset.setValue("Aprobados: " + a, a);
                        defaultCategoryDataset.setValue("No aprobados: "+ r, r);
                        
                        JFreeChart jFreeChart = ChartFactory.createPieChart(
                        "Actividades aprobadas y no aprobadas\n\n",  //pie chart title
                        defaultCategoryDataset, //pie chart dataset
                        false, false, false);  //pie chart> legend, tooltips and urls
                        
                        PdfContentByte pdfContentByte = writer.getDirectContent();
                        int width = 400; //width of PieChart
                        int height = 150; //height of pieChart
                        PdfTemplate pdfTemplate = pdfContentByte.createTemplate(width, height);
                        //document.newPage();
                        //create graphics
                        Graphics2D graphics2d = pdfTemplate.createGraphics(width, height, new DefaultFontMapper());
           
                        //create rectangle
                        java.awt.geom.Rectangle2D rectangle2d = new java.awt.geom.Rectangle2D.Double(0, 0, width, height);
 
                        jFreeChart.draw(graphics2d, rectangle2d);
 
                        graphics2d.dispose();
                        pdfContentByte.addTemplate(pdfTemplate, 40, 200); //0, 0 will draw PIE chart on bottom left of page
                        //Add a graphic end graphic
                        
                        //document.newPage();
                        
                        //Add another Graphic
                        int ac21 = 0, ac22 = 0, ac23 = 0, ac24 = 0, ac25 = 0, ac211 = 0, ac212 = 0;
                        ac21 = getNum2_1(1);
                        ac22 = getNum2_2(1);
                        ac23 = getNum2_3(1);
                        ac24 = getNum2_4(1);
                        ac25 = getNum2_5(1);
                        ac211 = getNum2_11(1);
                        ac212 = getNum2_12(1);
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
                        pdfContentByte2.addTemplate(pdfTemplate2, 0, 400); //0, 0 will draw BAR chart on bottom left of page
                        
                        //Add another Graphic end
                        document.newPage();*/
                        
                        
                        addTablaEvaluadoresProfesor(document);
                        addTablaNumProfesor(document);
                        addTablaEvaluador(document);
                        addTablaProfesores(document);
                        addTabla2_1(document);
                        addTabla2_2(document);
                        addTabla2_3(document);
                        addTabla2_4(document);
                        addTabla2_5(document);
                        addTabla2_11(document);
                        addTabla2_12(document);
                        addTablaAcota1(document);
                        //System.out.println("Hola12");
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
        /*private static void addImagenes(Document document) throws BadElementException, IOException, DocumentException
        {
            Image cofaa= Image.getInstance("C:\\psf\\Home\\Documents\\11111\\AlumnosBEIFI\\ipn.png");
            Image IPN= Image.getInstance("C:\\psf\\Home\\Documents\\11111\\AlumnosBEIFI\\cofaa.png");
            
            //Image cofaa= Image.getInstance("\\Usuarios\\ipn.png");//images for the server
            Image IPN= Image.getInstance("\\Usuarios\\cofaa.png");
            
            cofaa.scalePercent(65);
            IPN.scalePercent(55);
            cofaa.setAbsolutePosition(480, 750);
            IPN.setAbsolutePosition(35,740);
            
            document.add(cofaa);
            document.add(IPN);
        }*/
        
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
        
        private void addTablaProfesores (Document document) throws Exception{
            Paragraph preface = new Paragraph();
            addEmptyLine(preface, 3);    
            document.add(preface);
            document.add(tabla_profesores_nivel());
        }
        
        private void addTabla2_1(Document document) throws Exception{
            Paragraph preface = new Paragraph();
            addEmptyLine(preface, 3);    
            document.add(preface);
            document.add(tabla_alumnos());
        }
        private void addTabla2_2(Document document) throws Exception{
            Paragraph preface = new Paragraph();
            addEmptyLine(preface, 3);    
            document.add(preface);
            document.add(tabla_publicaciones());
        }
        private void addTabla2_3(Document document) throws Exception{
            Paragraph preface = new Paragraph();
            addEmptyLine(preface, 3);    
            document.add(preface);
            document.add(tabla_eventos());
        }
        private void addTabla2_4(Document document) throws Exception{
            Paragraph preface = new Paragraph();
            addEmptyLine(preface, 3);    
            document.add(preface);
            document.add(tabla_proyectos());
        }
        private void addTabla2_5(Document document) throws Exception{
            Paragraph preface = new Paragraph();
            addEmptyLine(preface, 3);    
            document.add(preface);
            document.add(tabla_obras());
        }
        private void addTabla2_11(Document document) throws Exception{
            Paragraph preface = new Paragraph();
            addEmptyLine(preface, 3);    
            document.add(preface);
            document.add(tabla_TT());
        }
        private void addTabla2_12(Document document) throws Exception{
            Paragraph preface = new Paragraph();
            addEmptyLine(preface, 3);    
            document.add(preface);
            document.add(tabla_plan_estu());
        }
        
        private void addTablaAcota1(Document document) throws Exception{
            Paragraph preface = new Paragraph();
            addEmptyLine(preface, 3);    
            document.add(preface);
            document.add(tabla_acota1());
        }
        
        private void addTablaEvaluador(Document document) throws Exception
        {
            Paragraph preface = new Paragraph();
            addEmptyLine(preface, 3);    
            document.add(preface);
            document.add(tabla_evaluador());
            
        }
        
         private void addEmptyLine(Paragraph paragraph, int number) {
                for (int i = 0; i < number; i++) {
                        paragraph.add(new Paragraph(" "));
                }
                
        }
         
         private PdfPTable tablaEvaluador_profe() throws Exception{
             PdfPTable tabla_evaluador = new PdfPTable(5);
             tabla_evaluador.setWidths(new int[]{2,2,3,2,3});
             int anio = 0, anio_fin = 0;
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
                    if(rb.getInt("periodo") == 1){
                        anio = 2017;
                        anio_fin = 2018;
                    }
                    else if(rb.getInt("periodo") == 2){
                        anio = 2018;
                        anio_fin = 2019;
                    }
                    else if(rb.getInt("periodo") == 3){
                        anio = 2019;
                        anio_fin = 2020;
                    }
                    else if(rb.getInt("periodo") == 4){
                        anio = 2020;
                        anio_fin = 2021;
                    }
                    tabla_evaluador.addCell(anio + " - " + anio_fin);
                }
                
             
             return tabla_evaluador;
         
         }
         
         private PdfPTable tabla_num_prof() throws Exception{
             PdfPTable tabla_num = new PdfPTable(2);
             tabla_num.setWidths(new int[]{2,2});
             String periodo = "";
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
                    periodo = re.getString("periodo_actual");
                }
                //System.out.println(i);
                numberAsString = Integer.toString(i);
                tabla_num.addCell(numberAsString);
                i = 0;
                rp = lb.executeQuery("SELECT * FROM profesor WHERE periodo = " + periodo);
                while(rp.next()){
                   i++;
                }
                //System.out.println(numberAsString);
                numberAsString = Integer.toString(i);
                tabla_num.addCell(numberAsString);
             return tabla_num;
         }
         
         private PdfPTable tabla_evaluador() throws Exception{
             PdfPTable tabla_num = new PdfPTable(2);
             tabla_num.setWidths(new int[]{2,2});
                PdfPCell Titulo_tabla = new PdfPCell(new Phrase("Actividades aceptadas por evaluador", encabezadost));
                PdfPCell evaluador = new PdfPCell(new Phrase("Número de empleado del evaluador"));
                PdfPCell actividades = new PdfPCell(new Phrase("Número de actividades aceptadas"));
                
                
                Titulo_tabla.setHorizontalAlignment(Element.ALIGN_CENTER);
                Titulo_tabla.setVerticalAlignment(Element.ALIGN_MIDDLE);
                Titulo_tabla.setBackgroundColor(new BaseColor(153, 0, 76));
                Titulo_tabla.setColspan(5);
                Titulo_tabla.setExtraParagraphSpace(15f);
                tabla_num.addCell(Titulo_tabla);
                
                evaluador.setHorizontalAlignment(Element.ALIGN_CENTER);
                evaluador.setVerticalAlignment(Element.ALIGN_MIDDLE);
                tabla_num.addCell(evaluador);

                actividades.setHorizontalAlignment(Element.ALIGN_CENTER);
                actividades.setVerticalAlignment(Element.ALIGN_MIDDLE);
                tabla_num.addCell(actividades);

                /*Aqui van las consultas de las Actividades del profesor*/
                int[] evaluador_num = new int[100];
                int[][] profesor_num = new int[300][300];
                String numberAsString, numberAsString2;
                int eva = 0, prof = 0, num_prof = 0, i = 0, n = 0, aux, suma_act = 0;
                ResultSet rs, ra;
                rs = lb.executeQuery("SELECT * FROM evaluador_evalua_profesor");
                while(rs.next()){
                    if(i == 0)
                        aux = 1;
                    else 
                        aux = i;
                    if(evaluador_num[aux - 1] != rs.getInt("id_usuario_ev")){
                        evaluador_num[i] = rs.getInt("id_usuario_ev");
                        i++;
                    }
                    else{
                        System.out.println("Ya existe");
                    }
                }//We get evaluators
                for(int e = 0; e < i; e++){
                    aux = getAccepted_Activities(evaluador_num[e]);
                    numberAsString = Integer.toString(evaluador_num[e]);
                    tabla_num.addCell(numberAsString);
                    numberAsString2 = Integer.toString(aux);
                    tabla_num.addCell(numberAsString2);
                }
             return tabla_num;
         }
         private PdfPTable tabla_profesores_nivel() throws Exception{
             PdfPTable tabla_num = new PdfPTable(3);
             int anio = 0, anio_fin = 0;
             tabla_num.setWidths(new int[]{2,2,2});
                PdfPCell Titulo_tabla = new PdfPCell(new Phrase("Lista de profesores participantes para este periodo", encabezadost));
                PdfPCell profesor = new PdfPCell(new Phrase("Número de empleado"));
                PdfPCell nivel = new PdfPCell(new Phrase("Nivel de beca (Preliminar)"));
                PdfPCell periodo = new PdfPCell(new Phrase("Periodo"));
                
                
                Titulo_tabla.setHorizontalAlignment(Element.ALIGN_CENTER);
                Titulo_tabla.setVerticalAlignment(Element.ALIGN_MIDDLE);
                Titulo_tabla.setBackgroundColor(new BaseColor(153, 0, 76));
                Titulo_tabla.setColspan(5);
                Titulo_tabla.setExtraParagraphSpace(15f);
                tabla_num.addCell(Titulo_tabla);
                
                profesor.setHorizontalAlignment(Element.ALIGN_CENTER);
                profesor.setVerticalAlignment(Element.ALIGN_MIDDLE);
                tabla_num.addCell(profesor);

                nivel.setHorizontalAlignment(Element.ALIGN_CENTER);
                nivel.setVerticalAlignment(Element.ALIGN_MIDDLE);
                tabla_num.addCell(nivel);
                
                periodo.setHorizontalAlignment(Element.ALIGN_CENTER);
                periodo.setVerticalAlignment(Element.ALIGN_MIDDLE);
                tabla_num.addCell(periodo);

                /*Aqui van las consultas de las Actividades del profesor*/
                ResultSet rs, rperiodo;
                int periodo_actual = 0;
                rperiodo = lb.executeQuery("SELECT * FROM evaluador");
                while(rperiodo.next()){
                    periodo_actual = rperiodo.getInt("periodo_actual");
                }
                rs = lb.executeQuery("SELECT * FROM profesor WHERE periodo = " + periodo_actual);
                while(rs.next()){
                    tabla_num.addCell(rs.getString("id_usuario"));
                    tabla_num.addCell(rs.getString("nivel"));
                    if(rs.getInt("periodo") == 1){
                        anio = 2017;
                        anio_fin = 2018;
                    }
                    else if(rs.getInt("periodo") == 2){
                        anio = 2018;
                        anio_fin = 2019;
                    }
                    else if(rs.getInt("periodo") == 3){
                        anio = 2019;
                        anio_fin = 2020;
                    }
                    else if(rs.getInt("periodo") == 4){
                        anio = 2020;
                        anio_fin = 2021;
                    }
                    tabla_num.addCell(anio + " - " + anio_fin);
                }
             return tabla_num;
         }
         
         private PdfPTable tabla_alumnos() throws Exception{
             PdfPTable tabla_num = new PdfPTable(4);
             int a = 0, b = 0, c = 0, d = 0, e = 0;
             String numberAsString;
             tabla_num.setWidths(new int[]{2,2, 2, 2});
                PdfPCell Titulo_tabla = new PdfPCell(new Phrase("Alumnos BEIFI y de SS", encabezadost));
                PdfPCell BEIFI_Acep = new PdfPCell(new Phrase("BEIFI aceptados"));
                PdfPCell BEIFI_No = new PdfPCell(new Phrase("BEIFI no aceptados"));
                PdfPCell SS_Acep = new PdfPCell(new Phrase("SS aceptados"));
                PdfPCell SS_No = new PdfPCell(new Phrase("SS no aceptados"));
                
                
                Titulo_tabla.setHorizontalAlignment(Element.ALIGN_CENTER);
                Titulo_tabla.setVerticalAlignment(Element.ALIGN_MIDDLE);
                Titulo_tabla.setBackgroundColor(new BaseColor(153, 0, 76));
                Titulo_tabla.setColspan(5);
                Titulo_tabla.setExtraParagraphSpace(15f);
                tabla_num.addCell(Titulo_tabla);
                
                BEIFI_Acep.setHorizontalAlignment(Element.ALIGN_CENTER);
                BEIFI_Acep.setVerticalAlignment(Element.ALIGN_MIDDLE);
                tabla_num.addCell(BEIFI_Acep);

                BEIFI_No.setHorizontalAlignment(Element.ALIGN_CENTER);
                BEIFI_No.setVerticalAlignment(Element.ALIGN_MIDDLE);
                tabla_num.addCell(BEIFI_No);
                
                SS_Acep.setHorizontalAlignment(Element.ALIGN_CENTER);
                SS_Acep.setVerticalAlignment(Element.ALIGN_MIDDLE);
                tabla_num.addCell(SS_Acep);
                
                 SS_No.setHorizontalAlignment(Element.ALIGN_CENTER);
                SS_No.setVerticalAlignment(Element.ALIGN_MIDDLE);
                tabla_num.addCell(SS_No);
                
                //we get the four numbers for students
                a = getNum2_1(2);
                numberAsString = Integer.toString(a);
                tabla_num.addCell(numberAsString);
                b = getNum2_1(3);
                numberAsString = Integer.toString(b);
                tabla_num.addCell(numberAsString);
                c = getNum2_1(4);
                numberAsString = Integer.toString(c);
                tabla_num.addCell(numberAsString);
                d = getNum2_1(5);
                numberAsString = Integer.toString(d);
                tabla_num.addCell(numberAsString);
                
             return tabla_num;
         }
         private PdfPTable tabla_publicaciones() throws Exception{
             PdfPTable tabla_num = new PdfPTable(5);
             int a = 0, b = 0, c = 0, d = 0, e = 0;
             String numberAsString;
             tabla_num.setWidths(new int[]{2,2, 2, 2, 2});
                PdfPCell Titulo_tabla = new PdfPCell(new Phrase("Publicaciones aceptadas", encabezadost));
                PdfPCell boletin = new PdfPCell(new Phrase("Boletínes"));
                PdfPCell sin_nacional = new PdfPCell(new Phrase("Sin arbitraje, Nacional"));
                PdfPCell sin_inter = new PdfPCell(new Phrase("Sin abitraje, Internacional"));
                PdfPCell con_nacional = new PdfPCell(new Phrase("Con arbitraje, Nacional"));
                PdfPCell con_inter = new PdfPCell(new Phrase("Con arbitraje, Internacional"));
                
                
                Titulo_tabla.setHorizontalAlignment(Element.ALIGN_CENTER);
                Titulo_tabla.setVerticalAlignment(Element.ALIGN_MIDDLE);
                Titulo_tabla.setBackgroundColor(new BaseColor(153, 0, 76));
                Titulo_tabla.setColspan(5);
                Titulo_tabla.setExtraParagraphSpace(15f);
                tabla_num.addCell(Titulo_tabla);
                
                boletin.setHorizontalAlignment(Element.ALIGN_CENTER);
                boletin.setVerticalAlignment(Element.ALIGN_MIDDLE);
                tabla_num.addCell(boletin);

                sin_nacional.setHorizontalAlignment(Element.ALIGN_CENTER);
                sin_nacional.setVerticalAlignment(Element.ALIGN_MIDDLE);
                tabla_num.addCell(sin_nacional);
                
                sin_inter.setHorizontalAlignment(Element.ALIGN_CENTER);
                sin_inter.setVerticalAlignment(Element.ALIGN_MIDDLE);
                tabla_num.addCell(sin_inter);
                
                con_nacional.setHorizontalAlignment(Element.ALIGN_CENTER);
                con_nacional.setVerticalAlignment(Element.ALIGN_MIDDLE);
                tabla_num.addCell(con_nacional);
                
                con_inter.setHorizontalAlignment(Element.ALIGN_CENTER);
                con_inter.setVerticalAlignment(Element.ALIGN_MIDDLE);
                tabla_num.addCell(con_inter);

                /*Aqui van las consultas de las Actividades del profesor*/
                a = getNum2_2(2);
                numberAsString = Integer.toString(a);
                tabla_num.addCell(numberAsString);
                b = getNum2_2(3);
                numberAsString = Integer.toString(b);
                tabla_num.addCell(numberAsString);
                c = getNum2_2(4);
                numberAsString = Integer.toString(c);
                tabla_num.addCell(numberAsString);
                d = getNum2_2(5);
                numberAsString = Integer.toString(d);
                tabla_num.addCell(numberAsString);
                e = getNum2_2(6);
                numberAsString = Integer.toString(e);
                tabla_num.addCell(numberAsString);
             return tabla_num;
         }
         private PdfPTable tabla_eventos() throws Exception{
             PdfPTable tabla_num = new PdfPTable(3);
             int a = 0, b = 0, c = 0, d = 0;
             String numberAsString;
             tabla_num.setWidths(new int[]{2,2, 2});
                PdfPCell Titulo_tabla = new PdfPCell(new Phrase("Eventos aceptados", encabezadost));
                PdfPCell sin_ponencia = new PdfPCell(new Phrase("Institucional sin ponencia publicada"));
                PdfPCell resumen_pub = new PdfPCell(new Phrase("Institucional con resumen publicado"));
                PdfPCell pub_exten = new PdfPCell(new Phrase("Institucional publicado en extenso"));
                
                
                Titulo_tabla.setHorizontalAlignment(Element.ALIGN_CENTER);
                Titulo_tabla.setVerticalAlignment(Element.ALIGN_MIDDLE);
                Titulo_tabla.setBackgroundColor(new BaseColor(153, 0, 76));
                Titulo_tabla.setColspan(5);
                Titulo_tabla.setExtraParagraphSpace(15f);
                tabla_num.addCell(Titulo_tabla);
                
                sin_ponencia.setHorizontalAlignment(Element.ALIGN_CENTER);
                sin_ponencia.setVerticalAlignment(Element.ALIGN_MIDDLE);
                tabla_num.addCell(sin_ponencia);

                resumen_pub.setHorizontalAlignment(Element.ALIGN_CENTER);
                resumen_pub.setVerticalAlignment(Element.ALIGN_MIDDLE);
                tabla_num.addCell(resumen_pub);
                
                pub_exten.setHorizontalAlignment(Element.ALIGN_CENTER);
                pub_exten.setVerticalAlignment(Element.ALIGN_MIDDLE);
                tabla_num.addCell(pub_exten);
                
                a = getNum2_3(2);
                numberAsString = Integer.toString(a);
                tabla_num.addCell(numberAsString);
                
                b = getNum2_3(3);
                numberAsString = Integer.toString(b);
                tabla_num.addCell(numberAsString);
                
                c = getNum2_3(4);
                numberAsString = Integer.toString(c);
                tabla_num.addCell(numberAsString);
                
                
             return tabla_num;
         }
         
         private PdfPTable tabla_proyectos() throws Exception{
             PdfPTable tabla_num = new PdfPTable(2);
             int a = 0, b = 0;
             String numberAsString;
             tabla_num.setWidths(new int[]{2, 2});
                PdfPCell Titulo_tabla = new PdfPCell(new Phrase("Proyectos SIP aceptados y no acpetados", encabezadost));
                PdfPCell aceptados = new PdfPCell(new Phrase("Aceptados"));
                PdfPCell no_aceptados = new PdfPCell(new Phrase("No aceptados"));
                
                
                Titulo_tabla.setHorizontalAlignment(Element.ALIGN_CENTER);
                Titulo_tabla.setVerticalAlignment(Element.ALIGN_MIDDLE);
                Titulo_tabla.setBackgroundColor(new BaseColor(153, 0, 76));
                Titulo_tabla.setColspan(5);
                Titulo_tabla.setExtraParagraphSpace(15f);
                tabla_num.addCell(Titulo_tabla);
                
                aceptados.setHorizontalAlignment(Element.ALIGN_CENTER);
                aceptados.setVerticalAlignment(Element.ALIGN_MIDDLE);
                tabla_num.addCell(aceptados);

                no_aceptados.setHorizontalAlignment(Element.ALIGN_CENTER);
                no_aceptados.setVerticalAlignment(Element.ALIGN_MIDDLE);
                tabla_num.addCell(no_aceptados);

                /*Aqui van las consultas de las Actividades del profesor*/
                a = getNum2_4(2);
                numberAsString = Integer.toString(a);
                tabla_num.addCell(numberAsString);
                
                b = getNum2_4(3);
                numberAsString = Integer.toString(b);
                tabla_num.addCell(numberAsString);
             return tabla_num;
         }
         
         private PdfPTable tabla_obras() throws Exception{
             PdfPTable tabla_num = new PdfPTable(12);
             int a = 0, b = 0, c = 0, d = 0, e, f, g, h, i, j, k, l;
             String numberAsString;
             tabla_num.setWidths(new int[]{2,2,2,2,2,2,2,2,2,2,2,2});
                PdfPCell Titulo_tabla = new PdfPCell(new Phrase("Obras con derecho de autor aceptadas", encabezadost));
                PdfPCell artis = new PdfPCell(new Phrase("O. A."));
                PdfPCell arqui = new PdfPCell(new Phrase("O. Arqui."));
                PdfPCell fotogra = new PdfPCell(new Phrase("O. Foto."));
                PdfPCell apuntes = new PdfPCell(new Phrase("Manual"));
                PdfPCell cine = new PdfPCell(new Phrase("O. Cine."));
                PdfPCell multimedia = new PdfPCell(new Phrase("Multimedia"));
                PdfPCell tv_show = new PdfPCell(new Phrase("Tv. show"));
                PdfPCell dis_graf = new PdfPCell(new Phrase("Dis. Gra."));
                PdfPCell compilacion = new PdfPCell(new Phrase("O. Compi."));
                PdfPCell libro = new PdfPCell(new Phrase("Ed. Libro"));
                PdfPCell computo = new PdfPCell(new Phrase("P. Com."));
                PdfPCell digital = new PdfPCell(new Phrase("Ma. Dig."));
                
                
                Titulo_tabla.setHorizontalAlignment(Element.ALIGN_CENTER);
                Titulo_tabla.setVerticalAlignment(Element.ALIGN_MIDDLE);
                Titulo_tabla.setBackgroundColor(new BaseColor(153, 0, 76));
                Titulo_tabla.setColspan(12);
                Titulo_tabla.setExtraParagraphSpace(15f);
                tabla_num.addCell(Titulo_tabla);
                
                artis.setHorizontalAlignment(Element.ALIGN_CENTER);
                artis.setVerticalAlignment(Element.ALIGN_MIDDLE);
                tabla_num.addCell(artis);

                arqui.setHorizontalAlignment(Element.ALIGN_CENTER);
                arqui.setVerticalAlignment(Element.ALIGN_MIDDLE);
                tabla_num.addCell(arqui);
                
                fotogra.setHorizontalAlignment(Element.ALIGN_CENTER);
                fotogra.setVerticalAlignment(Element.ALIGN_MIDDLE);
                tabla_num.addCell(fotogra);
                
                apuntes.setHorizontalAlignment(Element.ALIGN_CENTER);
                apuntes.setVerticalAlignment(Element.ALIGN_MIDDLE);
                tabla_num.addCell(apuntes);
                
                cine.setHorizontalAlignment(Element.ALIGN_CENTER);
                cine.setVerticalAlignment(Element.ALIGN_MIDDLE);
                tabla_num.addCell(cine);
                
                multimedia.setHorizontalAlignment(Element.ALIGN_CENTER);
                multimedia.setVerticalAlignment(Element.ALIGN_MIDDLE);
                tabla_num.addCell(multimedia);
                
                tv_show.setHorizontalAlignment(Element.ALIGN_CENTER);
                tv_show.setVerticalAlignment(Element.ALIGN_MIDDLE);
                tabla_num.addCell(tv_show);
                
                dis_graf.setHorizontalAlignment(Element.ALIGN_CENTER);
                dis_graf.setVerticalAlignment(Element.ALIGN_MIDDLE);
                tabla_num.addCell(dis_graf);
                
                compilacion.setHorizontalAlignment(Element.ALIGN_CENTER);
                compilacion.setVerticalAlignment(Element.ALIGN_MIDDLE);
                tabla_num.addCell(compilacion);
                
                libro.setHorizontalAlignment(Element.ALIGN_CENTER);
                libro.setVerticalAlignment(Element.ALIGN_MIDDLE);
                tabla_num.addCell(libro);
                
                computo.setHorizontalAlignment(Element.ALIGN_CENTER);
                computo.setVerticalAlignment(Element.ALIGN_MIDDLE);
                tabla_num.addCell(computo);
                
                digital.setHorizontalAlignment(Element.ALIGN_CENTER);
                digital.setVerticalAlignment(Element.ALIGN_MIDDLE);
                tabla_num.addCell(digital);

                /*Aqui van las consultas de las Actividades del profesor*/
                a = getNum2_5(2);
                numberAsString = Integer.toString(a);
                tabla_num.addCell(numberAsString);
                b = getNum2_5(3);
                numberAsString = Integer.toString(b);
                tabla_num.addCell(numberAsString);
                c = getNum2_5(4);
                numberAsString = Integer.toString(c);
                tabla_num.addCell(numberAsString);
                d = getNum2_5(5);
                numberAsString = Integer.toString(d);
                tabla_num.addCell(numberAsString);
                e = getNum2_5(6);
                numberAsString = Integer.toString(e);
                tabla_num.addCell(numberAsString);
                f = getNum2_5(7);
                numberAsString = Integer.toString(f);
                tabla_num.addCell(numberAsString);
                g = getNum2_5(8);
                numberAsString = Integer.toString(g);
                tabla_num.addCell(numberAsString);
                h = getNum2_5(9);
                numberAsString = Integer.toString(h);
                tabla_num.addCell(numberAsString);
                i = getNum2_5(10);
                numberAsString = Integer.toString(i);
                tabla_num.addCell(numberAsString);
                j = getNum2_5(11);
                numberAsString = Integer.toString(j);
                tabla_num.addCell(numberAsString);
                k = getNum2_5(12);
                numberAsString = Integer.toString(k);
                tabla_num.addCell(numberAsString);
                l = getNum2_5(13);
                numberAsString = Integer.toString(l);
                tabla_num.addCell(numberAsString);

             return tabla_num;
         }
         
         private PdfPTable tabla_TT() throws Exception{
             PdfPTable tabla_num = new PdfPTable(2);
             int a = 0, b = 0, c = 0, d = 0;
             String numberAsString;
             tabla_num.setWidths(new int[]{2,2});
                PdfPCell Titulo_tabla = new PdfPCell(new Phrase("TT o tesis aceptados y rechazados", encabezadost));
                PdfPCell aceptado = new PdfPCell(new Phrase("Aceptados"));
                PdfPCell no_aceptado = new PdfPCell(new Phrase("No aceptados"));
                
                
                Titulo_tabla.setHorizontalAlignment(Element.ALIGN_CENTER);
                Titulo_tabla.setVerticalAlignment(Element.ALIGN_MIDDLE);
                Titulo_tabla.setBackgroundColor(new BaseColor(153, 0, 76));
                Titulo_tabla.setColspan(5);
                Titulo_tabla.setExtraParagraphSpace(15f);
                tabla_num.addCell(Titulo_tabla);
                
                aceptado.setHorizontalAlignment(Element.ALIGN_CENTER);
                aceptado.setVerticalAlignment(Element.ALIGN_MIDDLE);
                tabla_num.addCell(aceptado);

                no_aceptado.setHorizontalAlignment(Element.ALIGN_CENTER);
                no_aceptado.setVerticalAlignment(Element.ALIGN_MIDDLE);
                tabla_num.addCell(no_aceptado);

                /*Aqui van las consultas de las Actividades del profesor*/
                a = getNum2_11(2);
                numberAsString = Integer.toString(a);
                tabla_num.addCell(numberAsString);
                b = getNum2_11(3);
                numberAsString = Integer.toString(b);
                tabla_num.addCell(numberAsString);
             return tabla_num;
         }
         
         private PdfPTable tabla_plan_estu() throws Exception{
             PdfPTable tabla_num = new PdfPTable(8);
             int a = 0, b = 0, c = 0, d = 0, e, f, g, h;
             String numberAsString;
             tabla_num.setWidths(new int[]{2,2,2,2,2,2,2,2});
                PdfPCell Titulo_tabla = new PdfPCell(new Phrase("Participaciones aceptadas", encabezadost));
                PdfPCell coor_1 = new PdfPCell(new Phrase("Coord 1"));
                PdfPCell coor_2 = new PdfPCell(new Phrase("Corrd 2"));
                PdfPCell parti_1 = new PdfPCell(new Phrase("Parti 1"));
                PdfPCell parti_2 = new PdfPCell(new Phrase("Parti 2"));
                PdfPCell coor_1_1 = new PdfPCell(new Phrase("Coord 1 1"));
                PdfPCell coor_1_2 = new PdfPCell(new Phrase("Coord 1 2"));
                PdfPCell parti_1_1 = new PdfPCell(new Phrase("Parti 1 1"));
                PdfPCell parti_1_2 = new PdfPCell(new Phrase("Parti 1 2"));
                
                
                Titulo_tabla.setHorizontalAlignment(Element.ALIGN_CENTER);
                Titulo_tabla.setVerticalAlignment(Element.ALIGN_MIDDLE);
                Titulo_tabla.setBackgroundColor(new BaseColor(153, 0, 76));
                Titulo_tabla.setColspan(8);
                Titulo_tabla.setExtraParagraphSpace(15f);
                tabla_num.addCell(Titulo_tabla);
                
                coor_1.setHorizontalAlignment(Element.ALIGN_CENTER);
                coor_1.setVerticalAlignment(Element.ALIGN_MIDDLE);
                tabla_num.addCell(coor_1);

                coor_2.setHorizontalAlignment(Element.ALIGN_CENTER);
                coor_2.setVerticalAlignment(Element.ALIGN_MIDDLE);
                tabla_num.addCell(coor_2);
                
                parti_1.setHorizontalAlignment(Element.ALIGN_CENTER);
                parti_1.setVerticalAlignment(Element.ALIGN_MIDDLE);
                tabla_num.addCell(parti_1);
                
                parti_2.setHorizontalAlignment(Element.ALIGN_CENTER);
                parti_2.setVerticalAlignment(Element.ALIGN_MIDDLE);
                tabla_num.addCell(parti_2);
                
                coor_1_1.setHorizontalAlignment(Element.ALIGN_CENTER);
                coor_1_1.setVerticalAlignment(Element.ALIGN_MIDDLE);
                tabla_num.addCell(coor_1_1);
                
                coor_1_2.setHorizontalAlignment(Element.ALIGN_CENTER);
                coor_1_2.setVerticalAlignment(Element.ALIGN_MIDDLE);
                tabla_num.addCell(coor_1_2);
                
                parti_1_1.setHorizontalAlignment(Element.ALIGN_CENTER);
                parti_1_1.setVerticalAlignment(Element.ALIGN_MIDDLE);
                tabla_num.addCell(parti_1_1);
                
                parti_1_2.setHorizontalAlignment(Element.ALIGN_CENTER);
                parti_1_2.setVerticalAlignment(Element.ALIGN_MIDDLE);
                tabla_num.addCell(parti_1_2);

                /*Aqui van las consultas de las Actividades del profesor*/
                a = getNum2_12(2);
                numberAsString = Integer.toString(a);
                tabla_num.addCell(numberAsString);
                b = getNum2_12(3);
                numberAsString = Integer.toString(b);
                tabla_num.addCell(numberAsString);
                c = getNum2_12(4);
                numberAsString = Integer.toString(c);
                tabla_num.addCell(numberAsString);
                d = getNum2_12(5);
                numberAsString = Integer.toString(d);
                tabla_num.addCell(numberAsString);
                e = getNum2_12(6);
                numberAsString = Integer.toString(e);
                tabla_num.addCell(numberAsString);
                f = getNum2_12(7);
                numberAsString = Integer.toString(f);
                tabla_num.addCell(numberAsString);
                g = getNum2_12(8);
                numberAsString = Integer.toString(g);
                tabla_num.addCell(numberAsString);
                h = getNum2_12(9);
                numberAsString = Integer.toString(h);
                tabla_num.addCell(numberAsString);
             return tabla_num;
         }
         private PdfPTable tabla_acota1() throws Exception{
             PdfPTable tabla_num = new PdfPTable(2);
             int a = 0, b = 0, c = 0, d = 0, e, f, g, h;
             String numberAsString;
             tabla_num.setWidths(new int[]{1,5});
                PdfPCell Titulo_tabla = new PdfPCell(new Phrase("Acotaciones de Participaciones", encabezadost));
                PdfPCell abre = new PdfPCell(new Phrase("Abreviatura"));
                PdfPCell signi = new PdfPCell(new Phrase("Significado"));
                
                
                Titulo_tabla.setHorizontalAlignment(Element.ALIGN_CENTER);
                Titulo_tabla.setVerticalAlignment(Element.ALIGN_MIDDLE);
                Titulo_tabla.setBackgroundColor(new BaseColor(153, 0, 76));
                Titulo_tabla.setColspan(8);
                Titulo_tabla.setExtraParagraphSpace(15f);
                tabla_num.addCell(Titulo_tabla);
                
                abre.setHorizontalAlignment(Element.ALIGN_CENTER);
                abre.setVerticalAlignment(Element.ALIGN_MIDDLE);
                tabla_num.addCell(abre);

                signi.setHorizontalAlignment(Element.ALIGN_CENTER);
                signi.setVerticalAlignment(Element.ALIGN_MIDDLE);
                tabla_num.addCell(signi);

                /*Aqui van las consultas de las Actividades del profesor*/
                tabla_num.addCell("Coord 1");
                tabla_num.addCell("Coordinación en la elaboración de un plan de estudios");
                tabla_num.addCell("Coor 2");
                tabla_num.addCell("Coordinación en la actualización de un plan de estudios");
                tabla_num.addCell("Parti 1");
                tabla_num.addCell("Participación en la elaboración de un plan de estudios");
                tabla_num.addCell("Parti 2");
                tabla_num.addCell("Participación en la actualización de un plan de estudios");
                tabla_num.addCell("Coor 1 1");
                tabla_num.addCell("Coordinación en la elaboración de un programa de estudios");
                tabla_num.addCell("Coor 1 2");
                tabla_num.addCell("Coordinación en la actualización de un programa de estudios");
                tabla_num.addCell("Parti 1 1");
                tabla_num.addCell("Participación en la elaboración de un programa de estudios");
                tabla_num.addCell("Parti 1 2");
                tabla_num.addCell("Participación en la actualización de un programa de estudios");
                
                
             return tabla_num;
         }
         
         private int getnumberA() throws SQLException{
             ResultSet ra, rp, re, rpro, rob, rtt, rpar_plan, rperiodo;
             int a = 0, b = 12, c = 11, d = 0, e = 0, f = 0, g = 0, suma_ap = 0, periodo = 0;
             //System.out.println(b);
             rperiodo = lb.executeQuery("SELECT * FROM evaluador");
             while(rperiodo.next()){
                 periodo = rperiodo.getInt("periodo_actual");
             }
             ra = lb.executeQuery("SELECT COUNT(*) FROM profesor_tiene_proyecto WHERE aceptado_alumno = 1 "
                     + "AND periodo = " + periodo/*AND 
             periodo = (same as professor)*/);
             if(ra.next())
                 a = ra.getInt(1);
             
             rp = lb.executeQuery("SELECT COUNT(*) FROM profesor_tiene_pub WHERE aceptado = 1 AND "
                     + "periodo = " + periodo/*AND periodo = (same as profesor)*/);
             if(rp.next())
                 b = rp.getInt(1);
             
             re = lb.executeQuery("SELECT COUNT(*) FROM profesor_participa_ev WHERE aceptado = 1 AND periodo = "
             + periodo);
             if(re.next())
                 c = re.getInt(1);
             //System.out.println(c);
             rpro = lb.executeQuery("SELECT COUNT(*) FROM profesor_tiene_proyecto WHERE aceptado = 1 AND periodo = "
             + periodo);
             if(rpro.next())
                 d = rpro.getInt(1);
             
             rob = lb.executeQuery("SELECT COUNT(*) FROM profesor_tiene_obra WHERE aceptado = 1 AND periodo = "
             + periodo);
             if(rob.next())
                 e = rob.getInt(1);
             
             rtt = lb.executeQuery("SELECT COUNT(*) FROM profesor_tiene_tt WHERE aceptado = 1 AND periodo = "
             + periodo);
             if(rtt.next())
                 f = rtt.getInt(1);
             
             rpar_plan = lb.executeQuery("SELECT COUNT(*) FROM profesor_participa_en_plan WHERE aceptado = 1 AND "
                     + "periodo = " + periodo);
             if(rpar_plan.next())
                 g = rpar_plan.getInt(1);
             suma_ap = a + b + c + d + e + f + g;
             //System.out.println(a + b + c + d + e + f + g);
             return suma_ap;
            }
        
         private int getnumberR() throws SQLException{
             ResultSet ra, rp, re, rpro, rob, rtt, rpar_plan, rperiodo;
             int a = 0, b = 12, c = 11, d = 0, e = 0, f = 0, g = 0, suma_ap = 0, periodo = 0;
             rperiodo = lb.executeQuery("SELECT * FROM evaluador");
             while(rperiodo.next()){
                 periodo = rperiodo.getInt("periodo_actual");
             }
             //System.out.println(b);
             ra = lb.executeQuery("SELECT COUNT(*) FROM profesor_tiene_proyecto WHERE aceptado_alumno = 0 "
                     + "AND periodo = " + periodo/*AND 
             periodo = (same as professor)*/);
             if(ra.next())
                 a = ra.getInt(1);
             
             rp = lb.executeQuery("SELECT COUNT(*) FROM profesor_tiene_pub WHERE aceptado = 0 AND "
                     + "periodo = " + periodo/*AND periodo = (same as profesor)*/);
             if(rp.next())
                 b = rp.getInt(1);
             
             re = lb.executeQuery("SELECT COUNT(*) FROM profesor_participa_ev WHERE aceptado = 0 "
                     + "AND periodo = " + periodo);
             if(re.next())
                 c = re.getInt(1);
             //System.out.println(c);
             rpro = lb.executeQuery("SELECT COUNT(*) FROM profesor_tiene_proyecto WHERE aceptado = 0 "
                     + "AND periodo = " + periodo);
             if(rpro.next())
                 d = rpro.getInt(1);
             
             rob = lb.executeQuery("SELECT COUNT(*) FROM profesor_tiene_obra WHERE aceptado = 0 "
                     + "AND periodo = " + periodo);
             if(rob.next())
                 e = rob.getInt(1);
             
             rtt = lb.executeQuery("SELECT COUNT(*) FROM profesor_tiene_tt WHERE aceptado = 0 "
                     + "AND periodo = " + periodo);
             if(rtt.next())
                 f = rtt.getInt(1);
             
             rpar_plan = lb.executeQuery("SELECT COUNT(*) FROM profesor_participa_en_plan WHERE aceptado = 0 "
                     + "AND periodo = " + periodo);
             if(rpar_plan.next())
                 g = rpar_plan.getInt(1);
             suma_ap = a + b + c + d + e + f + g;
             //System.out.println(a + b + c + d + e + f + g);
             return suma_ap;
             
            }
         private int getAccepted_Activities(int eva) throws SQLException{
             int suma = 0, i = 0, aux = 0, periodo = 0;
             ResultSet rs, r1, r2, r3, r4, r5, r11, r12, rperiodo;
             rperiodo = lb.executeQuery("SELECT * FROM evaluador");
             while(rperiodo.next()){
                 periodo = rperiodo.getInt("periodo_actual");
             }
             int [] profesor = new int[300];
             rs = lb.executeQuery("SELECT * FROM evaluador_evalua_profesor WHERE id_usuario_ev = " + eva);
             while(rs.next()){
                profesor[i] = rs.getInt("id_usuario_prof");
                i++;
             }
             for(int j = 0; j <= i; j++){
                 r1 = lb.executeQuery("SELECT COUNT(*) FROM profesor_tiene_proyecto WHERE "
                     + "aceptado_alumno = 1 AND id_usuario = " + profesor[j] + " AND periodo = " + periodo);
                 if(r1.next())
                     aux = r1.getInt(1);
                 suma += aux;
                 r2 = lb.executeQuery("SELECT COUNT(*) FROM profesor_tiene_pub WHERE aceptado = 1 AND id_usuario = "
                         + profesor[j] + " AND periodo = " + periodo);
                 if(r2.next())
                     aux = r2.getInt(1);
                 suma += aux;
                 r3 = lb.executeQuery("SELECT COUNT(*) FROM profesor_participa_ev WHERE aceptado = 1 AND id_usuario = "
                         + profesor[j] + " AND periodo = " + periodo);
                 if(r3.next())
                     aux = r3.getInt(1);
                 suma += aux;
                 r4 = lb.executeQuery("SELECT COUNT(*) FROM profesor_tiene_proyecto WHERE aceptado = 0 AND id_usuario = "
                         + profesor[j] + " AND periodo = " + periodo);
                 if(r4.next())
                     aux = r4.getInt(1);
                 suma += aux;
                 r5 = lb.executeQuery("SELECT COUNT(*) FROM profesor_tiene_obra WHERE aceptado = 1 AND id_usuario = "
                         + profesor[j] + " AND periodo = " + periodo);
                 if(r5.next())
                     aux = r5.getInt(1);
                 suma += aux;
                 r11 = lb.executeQuery("SELECT COUNT(*) FROM profesor_tiene_tt WHERE aceptado = 1 AND id_usuario = "
                         + profesor[j] + " AND periodo = " + periodo);
                 if(r11.next())
                     aux = r11.getInt(1);
                 suma += aux;
                 r12 = lb.executeQuery("SELECT COUNT(*) FROM profesor_participa_en_plan WHERE aceptado = 1 AND id_usuario = "
                         + profesor[j] + " AND periodo = " + periodo);
                 if(r12.next())
                     aux = r12.getInt(1);
                 suma += aux;
             }
             System.out.println(suma);
             return suma;
         }
         private int getNum2_1(int s) throws SQLException{//option1: get number of accepted and no accepted
             //option 2: get number of BEIFI, and third: number of SS
             ResultSet rs, rperiodo;
             int periodo = 0;
             rperiodo = lb.executeQuery("SELECT * FROM evaluador");
             while(rperiodo.next()){
                 periodo = rperiodo.getInt("periodo_actual");
             }
             int i = 0, a = 0;
             if(s == 1){
                 rs = lb.executeQuery("SELECT COUNT(*) FROM profesor_tiene_proyecto WHERE (aceptado_alumno = 0 OR "
                     + "aceptado_alumno = 1) AND periodo = " + periodo /*AND periodo = same as professor*/);
                 if(rs.next())
                     i = rs.getInt(1);    
                 return i;
             }
             else if(s == 2){
                 rs = lb.executeQuery("SELECT COUNT(*) FROM profesor_tiene_proyecto WHERE aceptado_alumno = 1 AND "
                     + "tipo_alumno = 'BEIFI' AND periodo = " + periodo);
                 if(rs.next())
                     i = rs.getInt(1);
                 return i;
             }
             else if(s == 3){
                 rs = lb.executeQuery("SELECT COUNT(*) FROM profesor_tiene_proyecto WHERE aceptado_alumno = 0 AND "
                     + "tipo_alumno = 'BEIFI' AND periodo = " + periodo);
                 if(rs.next())
                     i = rs.getInt(1);
                 return i;
             }
             else if(s == 4){
                 rs = lb.executeQuery("SELECT COUNT(*) FROM profesor_tiene_proyecto WHERE aceptado_alumno = 1 AND "
                     + "tipo_alumno = 'SS' AND periodo = " + periodo);
                 if(rs.next())
                     i = rs.getInt(1);  
                 return i;
             }
             else if(s == 5){
                 rs = lb.executeQuery("SELECT COUNT(*) FROM profesor_tiene_proyecto WHERE aceptado_alumno = 0 AND "
                     + "tipo_alumno = 'SS' AND periodo = " + periodo);
                 if(rs.next())
                     i = rs.getInt(1);
                 return i;
             }
                 return 0;
         }
         

         private int getNum2_2(int s) throws SQLException{
             ResultSet rs, rperiodo;
             int periodo = 0;
             rperiodo = lb.executeQuery("SELECT * FROM evaluador");
             while(rperiodo.next()){
                 periodo = rperiodo.getInt("periodo_actual");
             }
             int i = 0;
             if(s == 1){
                 rs = lb.executeQuery("SELECT COUNT(*) FROM profesor_tiene_pub WHERE (aceptado = 1 OR aceptado = 0) AND "
                         + "periodo = " + periodo);
                 if(rs.next())
                     i = rs.getInt(1);    
                 return i;
             }
             else if(s == 2){//boletin
                 rs = lb.executeQuery("SELECT COUNT(*) FROM profesor_tiene_pub WHERE aceptado = 1 AND id_tipo_pub = 1 AND "
                         + "periodo = " + periodo);
                 if(rs.next())
                     i = rs.getInt(1);
                 return i;
             }
             else if(s == 3){//Sin arbitraje, Nacional
                 rs = lb.executeQuery("SELECT COUNT(*) FROM profesor_tiene_pub WHERE aceptado = 1 AND id_tipo_pub = 2 "
                         + "AND periodo = " + periodo);
                 if(rs.next())
                     i = rs.getInt(1);
                 return i;
             }
             else if(s == 4){//Arbitraje, Nacional
                 rs = lb.executeQuery("SELECT COUNT(*) FROM profesor_tiene_pub WHERE aceptado = 1 AND id_tipo_pub = 3 "
                         + "AND periodo = " + periodo);
                 if(rs.next())
                     i = rs.getInt(1);
                 return i;
             }
             else if(s == 5){//Con arbitraje internacional
                 rs = lb.executeQuery("SELECT COUNT(*) FROM profesor_tiene_pub WHERE aceptado = 1 AND id_tipo_pub = 4 "
                         + "AND periodo = " + periodo);
                 if(rs.next())
                     i = rs.getInt(1);
                 return i;
             }
             else if(s == 6){//Sin arbitraje internacional
                 rs = lb.executeQuery("SELECT COUNT(*) FROM profesor_tiene_pub WHERE aceptado = 1 AND id_tipo_pub = 5 "
                         + "AND periodo = " + periodo);
                 if(rs.next())
                     i = rs.getInt(1);
                 return i;
             }
             return 0;
         }
         
         private int getNum2_3(int s) throws SQLException{
             ResultSet rs, rperiodo;
             int periodo = 0;
             rperiodo = lb.executeQuery("SELECT * FROM evaluador");
             while(rperiodo.next()){
                 periodo = rperiodo.getInt("periodo_actual");
             }
             int i = 0;
             if(s == 1){
                 rs = lb.executeQuery("SELECT COUNT(*) FROM profesor_participa_ev WHERE (aceptado = 0 OR aceptado = 1) "
                         + "AND periodo = " + periodo);
                 if(rs.next())
                     i = rs.getInt(1);    
                 return i;
             }
             else if(s == 2){
                 rs = lb.executeQuery("SELECT COUNT(*) FROM profesor_tiene_pub WHERE aceptado = 1 AND id_tipo_pub = 6 "
                         + "AND periodo = " + periodo);
                 if(rs.next())
                     i = rs.getInt(1);    
                 return i;
             }
             else if(s == 3){
                 rs = lb.executeQuery("SELECT COUNT(*) FROM profesor_tiene_pub WHERE aceptado = 1 AND id_tipo_pub = 7 "
                         + "AND periodo = " + periodo);
                 if(rs.next())
                     i = rs.getInt(1);    
                 return i;
             }
             else if(s == 4){
                 rs = lb.executeQuery("SELECT COUNT(*) FROM profesor_tiene_pub WHERE aceptado = 1 AND id_tipo_pub = 8 "
                         + "AND periodo = " + periodo);
                 if(rs.next())
                     i = rs.getInt(1);    
                 return i;
             }
             return 0;
         }
         
         private int getNum2_4(int s) throws SQLException{
             ResultSet rs, rperiodo;
             int periodo = 0;
             rperiodo = lb.executeQuery("SELECT * FROM evaluador");
             while(rperiodo.next()){
                 periodo = rperiodo.getInt("periodo_actual");
             }
             int i = 0;
             if(s == 1){
                 rs = lb.executeQuery("SELECT COUNT(*) FROM profesor_tiene_proyecto WHERE (aceptado = 0 OR aceptado = 1) "
                         + "AND periodo = " + periodo);
                if(rs.next())
                    i = rs.getInt(1);    
                return i;
             }
             else if(s == 2){
                 rs = lb.executeQuery("SELECT COUNT(*) FROM profesor_tiene_proyecto WHERE aceptado = 1 "
                         + "AND periodo = " + periodo);
                 if(rs.next())
                     i = rs.getInt(1);    
                 return i;
             }
             else if(s == 3){
                 rs = lb.executeQuery("SELECT COUNT(*) FROM profesor_tiene_proyecto WHERE aceptado = 0 "
                         + "AND periodo = " + periodo);
                 if(rs.next())
                     i = rs.getInt(1);    
                 return i;
             }
             return 0;
             
         }
         
         private int getNum2_5(int s) throws SQLException{
             ResultSet rs, rperiodo;
             int periodo = 0;
             rperiodo = lb.executeQuery("SELECT * FROM evaluador");
             while(rperiodo.next()){
                 periodo = rperiodo.getInt("periodo_actual");
             }
             int i = 0;
             if(s == 1) {
                 rs = lb.executeQuery("SELECT COUNT(*) FROM profesor_tiene_obra WHERE (aceptado = 0 OR aceptado = 1) "
                         + "AND periodo = " + periodo);
                 if(rs.next())
                    i = rs.getInt(1);    
                return i;
             }
             else if(s == 2){
                 rs = lb.executeQuery("SELECT COUNT(*) FROM profesor_tiene_obra WHERE aceptado = 1 AND id_tipo_obra = 1 "
                         + "AND periodo = " + periodo);
                 if(rs.next())
                    i = rs.getInt(1);    
                return i;
             }
             else if(s == 3){
                 rs = lb.executeQuery("SELECT COUNT(*) FROM profesor_tiene_obra WHERE aceptado = 1 AND id_tipo_obra = 2 "
                         + "AND periodo = " + periodo);
                 if(rs.next())
                    i = rs.getInt(1);    
                return i;
             }
             else if(s == 4){
                 rs = lb.executeQuery("SELECT COUNT(*) FROM profesor_tiene_obra WHERE aceptado = 1 AND id_tipo_obra = 3 "
                         + "AND periodo = " + periodo);
                 if(rs.next())
                    i = rs.getInt(1);    
                return i;
             }
             else if(s == 5){
                 rs = lb.executeQuery("SELECT COUNT(*) FROM profesor_tiene_obra WHERE aceptado = 1 AND id_tipo_obra = 4 "
                         + "AND periodo = " + periodo);
                 if(rs.next())
                    i = rs.getInt(1);    
                return i;
             }
             else if(s == 6){
                 rs = lb.executeQuery("SELECT COUNT(*) FROM profesor_tiene_obra WHERE aceptado = 1 AND id_tipo_obra = 5 "
                         + "AND periodo = " + periodo);
                 if(rs.next())
                    i = rs.getInt(1);    
                return i;
             }
             else if(s == 7){
                 rs = lb.executeQuery("SELECT COUNT(*) FROM profesor_tiene_obra WHERE aceptado = 1 AND id_tipo_obra = 6 "
                         + "AND periodo = " + periodo);
                 if(rs.next())
                    i = rs.getInt(1);    
                return i;
             }
             else if(s == 8){
                 rs = lb.executeQuery("SELECT COUNT(*) FROM profesor_tiene_obra WHERE aceptado = 1 AND id_tipo_obra = 7 "
                         + "AND periodo = " + periodo);
                 if(rs.next())
                    i = rs.getInt(1);    
                return i;
             }
             else if(s == 9){
                 rs = lb.executeQuery("SELECT COUNT(*) FROM profesor_tiene_obra WHERE aceptado = 1 AND id_tipo_obra = 8 "
                         + "AND periodo = " + periodo);
                 if(rs.next())
                    i = rs.getInt(1);    
                return i;
             }
             else if(s == 10){
                 rs = lb.executeQuery("SELECT COUNT(*) FROM profesor_tiene_obra WHERE aceptado = 1 AND id_tipo_obra = 9 "
                         + "AND periodo = " + periodo);
                 if(rs.next())
                    i = rs.getInt(1);    
                return i;
             }
             else if(s == 11){
                 rs = lb.executeQuery("SELECT COUNT(*) FROM profesor_tiene_obra WHERE aceptado = 1 AND id_tipo_obra = 10 "
                         + "AND periodo = " + periodo);
                 if(rs.next())
                    i = rs.getInt(1);    
                return i;
             }
             else if(s == 12){
                 rs = lb.executeQuery("SELECT COUNT(*) FROM profesor_tiene_obra WHERE aceptado = 1 AND id_tipo_obra = 11 "
                         + "AND periodo = " + periodo);
                 if(rs.next())
                    i = rs.getInt(1);    
                System.out.println(i + " aqui se ve");
                return i;
             }
             else if(s == 13){
                 rs = lb.executeQuery("SELECT COUNT(*) FROM profesor_tiene_obra WHERE aceptado = 1 AND aceptado = 12 "
                         + "AND periodo = " + periodo);
                 if(rs.next())
                    i = rs.getInt(1);    
                return i;
             }
             return 0;
         }
         
         private int getNum2_11(int s) throws SQLException{
             ResultSet rs, rperiodo;
             int periodo = 0;
             rperiodo = lb.executeQuery("SELECT * FROM evaluador");
             while(rperiodo.next()){
                 periodo = rperiodo.getInt("periodo_actual");
             }
             int i = 0;
             if(s == 1){
                 rs = lb.executeQuery("SELECT COUNT(*) FROM profesor_tiene_tt WHERE (aceptado = 0 OR aceptado = 1) "
                         + "AND periodo = " + periodo);
                 if(rs.next())
                     i = rs.getInt(1);    
                 return i;
             }
             else if(s == 2){
                 rs = lb.executeQuery("SELECT COUNT(*) FROM profesor_tiene_tt WHERE aceptado = 1 "
                         + "AND periodo = " + periodo);
                 if(rs.next())
                     i = rs.getInt(1);    
                 return i;
             }
             
             else if(s == 3){
                 rs = lb.executeQuery("SELECT COUNT(*) FROM profesor_tiene_tt WHERE aceptado = 0 "
                         + "AND periodo = " + periodo);
                 if(rs.next())
                     i = rs.getInt(1);    
                 return i;
             }
             return 0;
         }
         
         private int getNum2_12(int s) throws SQLException{
             ResultSet rs, rperiodo;
             int periodo = 0;
             rperiodo = lb.executeQuery("SELECT * FROM evaluador");
             while(rperiodo.next()){
                 periodo = rperiodo.getInt("periodo_actual");
             }
             int i = 0;
             if(s == 1){
                 rs = lb.executeQuery("SELECT COUNT(*) FROM profesor_participa_en_plan WHERE (aceptado = 0 OR aceptado = 1) "
                         + "AND periodo = " + periodo);
                 if(rs.next())
                     i = rs.getInt(1);    
                return i;
             }
             else if(s == 2){
                 rs = lb.executeQuery("SELECT COUNT(*) FROM profesor_participa_en_plan WHERE aceptado = 1 AND id_tipo_part = 1 "
                         + "AND periodo = " + periodo);
                 if(rs.next())
                     i = rs.getInt(1);    
                return i;
             }
             else if(s == 3){
                 rs = lb.executeQuery("SELECT COUNT(*) FROM profesor_participa_en_plan WHERE aceptado = 1 AND id_tipo_part = 2 "
                         + "AND periodo = " + periodo);
                 if(rs.next())
                     i = rs.getInt(1);    
                return i;
             }
             else if(s == 4){
                 rs = lb.executeQuery("SELECT COUNT(*) FROM profesor_participa_en_plan WHERE aceptado = 1 AND id_tipo_part = 3 "
                         + "AND periodo = " + periodo);
                 if(rs.next())
                     i = rs.getInt(1);    
                return i;
             }
             else if(s == 5){
                 rs = lb.executeQuery("SELECT COUNT(*) FROM profesor_participa_en_plan WHERE aceptado = 1 AND id_tipo_part = 4 "
                         + "AND periodo = " + periodo);
                 if(rs.next())
                     i = rs.getInt(1);    
                return i;
             }
             else if(s == 6){
                 rs = lb.executeQuery("SELECT COUNT(*) FROM profesor_participa_en_plan WHERE aceptado = 1 AND id_tipo_part = 5 "
                         + "AND periodo = " + periodo);
                 if(rs.next())
                     i = rs.getInt(1);    
                return i;
             }
             else if(s == 7){
                 rs = lb.executeQuery("SELECT COUNT(*) FROM profesor_participa_en_plan WHERE aceptado = 1 AND id_tipo_part = 6 "
                         + "AND periodo = " + periodo);
                 if(rs.next())
                     i = rs.getInt(1);    
                return i;
             }
             else if(s == 8){
                 rs = lb.executeQuery("SELECT COUNT(*) FROM profesor_participa_en_plan WHERE aceptado = 1 AND id_tipo_part = 7 "
                         + "AND periodo = " + periodo);
                 if(rs.next())
                     i = rs.getInt(1);    
                return i;
             }
             else if(s == 9){
                 rs = lb.executeQuery("SELECT COUNT(*) FROM profesor_participa_en_plan WHERE aceptado = 1 AND id_tipo_part = 8 "
                         + "AND periodo = " + periodo);
                 if(rs.next())
                     i = rs.getInt(1);    
                return i;
             }
             
             return 0;
         }
    
        public String getUsername() {
            return username;
        }

        public void setUsername(String username) {
            this.username = username;
        }

        
}
