/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package PDF;

/**
 *
 * @author PsysacElrick
 */
import java.io.FileOutputStream;
import java.util.Date;

import com.itextpdf.text.*;
import com.itextpdf.text.Anchor;
import com.itextpdf.text.BadElementException;
import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Chapter;
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
import com.itextpdf.text.pdf.PdfWriter;
import com.itextpdf.text.Image;
import com.itextpdf.text.pdf.PdfContentByte;
import java.io.IOException;

public class GenerateSimplePdfReportWithJasperReports {
        private static String FILE = "C:\\Users\\le_as\\Documents\\Escuela\\Pruebas PDF\\Reporte de Actividades_E-SIBE.pdf";
        private static Font catFont = new Font(Font.FontFamily.TIMES_ROMAN, 17,
                        Font.BOLD);
        private static Font redFont = new Font(Font.FontFamily.TIMES_ROMAN, 12,
                        Font.NORMAL, BaseColor.RED);
        private static Font subFont = new Font(Font.FontFamily.TIMES_ROMAN, 16,
                        Font.BOLD);
        private static Font smallBold = new Font(Font.FontFamily.TIMES_ROMAN, 13,
                        Font.BOLD);
        
        private static Font encabezadost = new Font(Font.FontFamily.TIMES_ROMAN,12, Font.NORMAL,BaseColor.WHITE);

        public String execute() 
        {
                try 
                {
                        Document document = new Document();
                        PdfWriter.getInstance(document, new FileOutputStream(FILE));
                        document.open();
                        addMetaData(document);
                        addImagenes(document);
                        addEncabezado(document);
                        addResumenProf(document);
                        addPunto1(document);
                        addPunto2(document);
                        addPunto3(document);
                        addPunto4(document);
                        addPunto5(document);
                        addPunto11(document);
                        addPunto12(document);
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
            document.addTitle("Reporte de Actividades General");
            document.addSubject("Beca SIBE");
            document.addKeywords("COFAA, SIBE, E-SIBE, Reporte de Actividades del Rubro 2");
            document.addAuthor("Comisión de Operación y Fomento de Actividades Académicas del IPN");
            document.addCreator("E-SIBE");
        }

         private static void addImagenes(Document document) throws BadElementException, IOException, DocumentException
        {
            Image cofaa= Image.getInstance("C:\\Users\\le_as\\Documents\\NetBeansProjects\\login\\web\\css\\cofaa.png");
            Image IPN= Image.getInstance("C:\\Users\\le_as\\Documents\\NetBeansProjects\\login\\web\\css\\ipn.png");
            
            cofaa.scalePercent(65);
            IPN.scalePercent(55);
            cofaa.setAbsolutePosition(480, 750);
            IPN.setAbsolutePosition(35,740);
            
            document.add(cofaa);
            document.add(IPN);
        }
        
        private static void addEncabezado(Document document) throws DocumentException 
        {
            Paragraph preface = new Paragraph();
            addEmptyLine(preface, 4);
            preface.setAlignment(Element.ALIGN_CENTER);
            preface.add(new Paragraph("E-SIBE", catFont));
            
            preface.add(new Paragraph("Reporte de actividades del rubro 2 de la"
                    + " beca SIBE de COFAA",smallBold));
            addEmptyLine(preface, 2);
            document.add(preface);
        }
        
        private static void addResumenProf(Document document) throws DocumentException
        {              
            Paragraph preface = new Paragraph();
            preface.add(new Paragraph("Datos Generales del Profesor",smallBold));
            preface.setAlignment(Element.ALIGN_CENTER);
            addEmptyLine(preface, 2);
            document.add(preface);
            document.add(TablaDatos());
        }
        
        private static void addPunto1(Document document) throws DocumentException 
        {
            Paragraph preface = new Paragraph();
            addEmptyLine(preface, 3);    
            document.add(preface);
            document.add(dospuntouno());
            
        }
        
        private static void addPunto2(Document document) throws DocumentException 
        {
            Paragraph preface = new Paragraph();
            addEmptyLine(preface, 3);    
            document.add(preface);
            document.add(dospuntodos());
            
        }
        
        private static void addPunto3(Document document) throws DocumentException 
        {
            Paragraph preface = new Paragraph();
            addEmptyLine(preface, 3);    
            document.add(preface);
            document.add(dospuntotres());
            
        }
        
        private static void addPunto4(Document document) throws DocumentException 
        {
            Paragraph preface = new Paragraph();
            addEmptyLine(preface, 3);    
            document.add(preface);
            document.add(dospuntocuatro());
            
        }
        
        private static void addPunto5(Document document) throws DocumentException 
        {
            Paragraph preface = new Paragraph();
            addEmptyLine(preface, 3);    
            document.add(preface);
            document.add(dospuntocinco());
            
        }
        
        private static void addPunto11(Document document) throws DocumentException 
        {
            Paragraph preface = new Paragraph();
            addEmptyLine(preface, 3);    
            document.add(preface);
            document.add(dospuntoonce());
            
        }
        
        private static void addPunto12(Document document) throws DocumentException 
        {
            Paragraph preface = new Paragraph();
            addEmptyLine(preface, 3);    
            document.add(preface);
            document.add(dospuntodoce());
            
        }
       
         
        private static PdfPTable TablaDatos() throws BadElementException, DocumentException 
        {
                PdfPTable Datos_prof = new PdfPTable(5);              
                Datos_prof.setWidths(new int[]{2,3,2,2,2});
                PdfPCell Titulo_tabla = new PdfPCell (new Phrase("Datos generales del Profesor",encabezadost));
                PdfPCell Nombre = new PdfPCell(new Phrase("Nombre del Profesor"));
                PdfPCell Matricula = new PdfPCell(new Phrase("No. de Empleado"));
                PdfPCell UA = new PdfPCell(new Phrase("Unidad Académica"));
                PdfPCell Puntos = new PdfPCell(new Phrase("Puntos obtenidos"));
                PdfPCell Nivel = new PdfPCell(new Phrase("Nivel de Beca"));
                
                Titulo_tabla.setHorizontalAlignment(Element.ALIGN_CENTER);
                Titulo_tabla.setVerticalAlignment(Element.ALIGN_MIDDLE);
                Titulo_tabla.setBackgroundColor(new BaseColor(153, 0, 76));
                Titulo_tabla.setColspan(5);
                Titulo_tabla.setExtraParagraphSpace(15f);
                Datos_prof.addCell(Titulo_tabla);
                
                Nombre.setHorizontalAlignment(Element.ALIGN_CENTER);
                Datos_prof.addCell(Nombre);

                Matricula.setHorizontalAlignment(Element.ALIGN_CENTER);
                Datos_prof.addCell(Matricula);

                UA.setHorizontalAlignment(Element.ALIGN_CENTER);
                Datos_prof.addCell(UA);

                Puntos.setHorizontalAlignment(Element.ALIGN_CENTER);
                Datos_prof.addCell(Puntos);

                Nivel.setHorizontalAlignment(Element.ALIGN_CENTER);
                Datos_prof.addCell(Nivel);

                /*Aqui van las consultas de los datos del profesor*/
                Datos_prof.addCell("Leonel Escobar Olivares");
                Datos_prof.addCell("2013630185");
                Datos_prof.addCell("ESCOM");
                Datos_prof.addCell("50");
                Datos_prof.addCell("I");
                
                return Datos_prof;
        }

        private static PdfPTable dospuntouno() throws BadElementException, DocumentException 
        {
                PdfPTable Dos_uno = new PdfPTable(5);  
                Dos_uno.setWidths(new int[]{2,2,3,2,3});
                PdfPCell Titulo_tabla = new PdfPCell(new Phrase("Actividad 2.1"
                        + " - Formación de Recursos Humanos para la Investigación",encabezadost));
                PdfPCell Num_Actividad = new PdfPCell(new Phrase("Número de Actividad"));
                PdfPCell Tipo_Actividad = new PdfPCell(new Phrase("Tipo de Actividad"));
                PdfPCell Ruta_alm = new PdfPCell(new Phrase("Ver archivo"));
                PdfPCell Puntos = new PdfPCell(new Phrase("Puntos obtenidos"));
                PdfPCell Observaciones = new PdfPCell(new Phrase("Observaciones"));
                PdfPCell celda=new PdfPCell();
                
                
                Titulo_tabla.setHorizontalAlignment(Element.ALIGN_CENTER);
                Titulo_tabla.setVerticalAlignment(Element.ALIGN_MIDDLE);
                Titulo_tabla.setBackgroundColor(new BaseColor(153, 0, 76));
                Titulo_tabla.setColspan(5);
                Titulo_tabla.setExtraParagraphSpace(15f);
                Dos_uno.addCell(Titulo_tabla);
                
                Num_Actividad.setHorizontalAlignment(Element.ALIGN_CENTER);
                Num_Actividad.setVerticalAlignment(Element.ALIGN_MIDDLE);
                Dos_uno.addCell(Num_Actividad);

                Tipo_Actividad.setHorizontalAlignment(Element.ALIGN_CENTER);
                Tipo_Actividad.setVerticalAlignment(Element.ALIGN_MIDDLE);
                Dos_uno.addCell(Tipo_Actividad);

                Ruta_alm.setHorizontalAlignment(Element.ALIGN_CENTER);
                Ruta_alm.setVerticalAlignment(Element.ALIGN_MIDDLE);
                Dos_uno.addCell(Ruta_alm);

                Puntos.setHorizontalAlignment(Element.ALIGN_CENTER);
                Puntos.setVerticalAlignment(Element.ALIGN_MIDDLE);
                Dos_uno.addCell(Puntos);

                Observaciones.setHorizontalAlignment(Element.ALIGN_CENTER);
                Observaciones.setVerticalAlignment(Element.ALIGN_MIDDLE);
                Dos_uno.addCell(Observaciones);

                /*Aqui van las consultas de las Actividades del profesor*/
               
                
                
                Dos_uno.addCell("2.1.1");
                Dos_uno.addCell("Alumno BEIFI");
                Dos_uno.addCell("Hipervinculo");
                Dos_uno.addCell("50");
                Dos_uno.addCell("-");
                
                return Dos_uno;
        }
        
        private static PdfPTable dospuntodos() throws BadElementException, DocumentException 
        {
                PdfPTable Dos_dos = new PdfPTable(5);  
                Dos_dos.setWidths(new int[]{2,2,3,2,3});
                PdfPCell Titulo_tabla = new PdfPCell(new Phrase("Actividad 2.2"
                        + " - Publicaciones Científicas y/o de Divulgación",encabezadost));
                PdfPCell Num_Actividad = new PdfPCell(new Phrase("Número de Actividad"));
                PdfPCell Tipo_Actividad = new PdfPCell(new Phrase("Tipo de Actividad"));
                PdfPCell Ruta_alm = new PdfPCell(new Phrase("Ver archivo"));
                PdfPCell Puntos = new PdfPCell(new Phrase("Puntos obtenidos"));
                PdfPCell Observaciones = new PdfPCell(new Phrase("Observaciones"));
                PdfPCell celda=new PdfPCell();
                
                
                Titulo_tabla.setHorizontalAlignment(Element.ALIGN_CENTER);
                Titulo_tabla.setVerticalAlignment(Element.ALIGN_MIDDLE);
                Titulo_tabla.setBackgroundColor(new BaseColor(153, 0, 76));
                Titulo_tabla.setColspan(5);
                Titulo_tabla.setExtraParagraphSpace(15f);
                Dos_dos.addCell(Titulo_tabla);
                
                Num_Actividad.setHorizontalAlignment(Element.ALIGN_CENTER);
                Num_Actividad.setVerticalAlignment(Element.ALIGN_MIDDLE);
                Dos_dos.addCell(Num_Actividad);

                Tipo_Actividad.setHorizontalAlignment(Element.ALIGN_CENTER);
                Tipo_Actividad.setVerticalAlignment(Element.ALIGN_MIDDLE);
                Dos_dos.addCell(Tipo_Actividad);

                Ruta_alm.setHorizontalAlignment(Element.ALIGN_CENTER);
                Ruta_alm.setVerticalAlignment(Element.ALIGN_MIDDLE);
                Dos_dos.addCell(Ruta_alm);

                Puntos.setHorizontalAlignment(Element.ALIGN_CENTER);
                Puntos.setVerticalAlignment(Element.ALIGN_MIDDLE);
                Dos_dos.addCell(Puntos);

                Observaciones.setHorizontalAlignment(Element.ALIGN_CENTER);
                Observaciones.setVerticalAlignment(Element.ALIGN_MIDDLE);
                Dos_dos.addCell(Observaciones);

                /*Aqui van las consultas de las Actividades del profesor*/

                Dos_dos.addCell("2.1.1");
                Dos_dos.addCell("Alumno BEIFI");
                Dos_dos.addCell("Hipervinculo");
                Dos_dos.addCell("50");
                Dos_dos.addCell("-");
                
                return Dos_dos;
        }
        
        private static PdfPTable dospuntotres() throws BadElementException, DocumentException 
        {
                PdfPTable Dos_tres = new PdfPTable(5);  
                Dos_tres.setWidths(new int[]{2,2,3,2,3});
                PdfPCell Titulo_tabla = new PdfPCell(new Phrase("Actividad 2.3"
                        + " - Eventos Académicos",encabezadost));
                PdfPCell Num_Actividad = new PdfPCell(new Phrase("Número de Actividad"));
                PdfPCell Tipo_Actividad = new PdfPCell(new Phrase("Tipo de Actividad"));
                PdfPCell Ruta_alm = new PdfPCell(new Phrase("Ver archivo"));
                PdfPCell Puntos = new PdfPCell(new Phrase("Puntos obtenidos"));
                PdfPCell Observaciones = new PdfPCell(new Phrase("Observaciones"));
                PdfPCell celda=new PdfPCell();
                
                
                Titulo_tabla.setHorizontalAlignment(Element.ALIGN_CENTER);
                Titulo_tabla.setVerticalAlignment(Element.ALIGN_MIDDLE);
                Titulo_tabla.setBackgroundColor(new BaseColor(153, 0, 76));
                Titulo_tabla.setColspan(5);
                Titulo_tabla.setExtraParagraphSpace(15f);
                Dos_tres.addCell(Titulo_tabla);
                
                Num_Actividad.setHorizontalAlignment(Element.ALIGN_CENTER);
                Num_Actividad.setVerticalAlignment(Element.ALIGN_MIDDLE);
                Dos_tres.addCell(Num_Actividad);

                Tipo_Actividad.setHorizontalAlignment(Element.ALIGN_CENTER);
                Tipo_Actividad.setVerticalAlignment(Element.ALIGN_MIDDLE);
                Dos_tres.addCell(Tipo_Actividad);

                Ruta_alm.setHorizontalAlignment(Element.ALIGN_CENTER);
                Ruta_alm.setVerticalAlignment(Element.ALIGN_MIDDLE);
                Dos_tres.addCell(Ruta_alm);

                Puntos.setHorizontalAlignment(Element.ALIGN_CENTER);
                Puntos.setVerticalAlignment(Element.ALIGN_MIDDLE);
                Dos_tres.addCell(Puntos);

                Observaciones.setHorizontalAlignment(Element.ALIGN_CENTER);
                Observaciones.setVerticalAlignment(Element.ALIGN_MIDDLE);
                Dos_tres.addCell(Observaciones);

                /*Aqui van las consultas de las Actividades del profesor*/
               
                
                
                Dos_tres.addCell("2.1.1");
                Dos_tres.addCell("Alumno BEIFI");
                Dos_tres.addCell("Hipervinculo");
                Dos_tres.addCell("50");
                Dos_tres.addCell("-");
                
                return Dos_tres;
        }
        
        private static PdfPTable dospuntocuatro() throws BadElementException, DocumentException 
        {
                PdfPTable Dos_cuatro = new PdfPTable(5);  
                Dos_cuatro.setWidths(new int[]{2,2,3,2,3});
                PdfPCell Titulo_tabla = new PdfPCell(new Phrase("Actividad 2.4"
                        + " - Investigación y/o Desarrollo Satisfactorio",encabezadost));
                PdfPCell Num_Actividad = new PdfPCell(new Phrase("Número de Actividad"));
                PdfPCell Tipo_Actividad = new PdfPCell(new Phrase("Tipo de Actividad"));
                PdfPCell Ruta_alm = new PdfPCell(new Phrase("Ver archivo"));
                PdfPCell Puntos = new PdfPCell(new Phrase("Puntos obtenidos"));
                PdfPCell Observaciones = new PdfPCell(new Phrase("Observaciones"));
                PdfPCell celda=new PdfPCell();
                
                
                Titulo_tabla.setHorizontalAlignment(Element.ALIGN_CENTER);
                Titulo_tabla.setVerticalAlignment(Element.ALIGN_MIDDLE);
                Titulo_tabla.setBackgroundColor(new BaseColor(153, 0, 76));
                Titulo_tabla.setColspan(5);
                Titulo_tabla.setExtraParagraphSpace(15f);
                Dos_cuatro.addCell(Titulo_tabla);
                
                Num_Actividad.setHorizontalAlignment(Element.ALIGN_CENTER);
                Num_Actividad.setVerticalAlignment(Element.ALIGN_MIDDLE);
                Dos_cuatro.addCell(Num_Actividad);

                Tipo_Actividad.setHorizontalAlignment(Element.ALIGN_CENTER);
                Tipo_Actividad.setVerticalAlignment(Element.ALIGN_MIDDLE);
                Dos_cuatro.addCell(Tipo_Actividad);

                Ruta_alm.setHorizontalAlignment(Element.ALIGN_CENTER);
                Ruta_alm.setVerticalAlignment(Element.ALIGN_MIDDLE);
                Dos_cuatro.addCell(Ruta_alm);

                Puntos.setHorizontalAlignment(Element.ALIGN_CENTER);
                Puntos.setVerticalAlignment(Element.ALIGN_MIDDLE);
                Dos_cuatro.addCell(Puntos);

                Observaciones.setHorizontalAlignment(Element.ALIGN_CENTER);
                Observaciones.setVerticalAlignment(Element.ALIGN_MIDDLE);
                Dos_cuatro.addCell(Observaciones);

                /*Aqui van las consultas de las Actividades del profesor*/
               
                
                
                Dos_cuatro.addCell("2.1.1");
                Dos_cuatro.addCell("Alumno BEIFI");
                Dos_cuatro.addCell("Hipervinculo");
                Dos_cuatro.addCell("50");
                Dos_cuatro.addCell("-");
                
                return Dos_cuatro;
        }
        
        private static PdfPTable dospuntocinco() throws BadElementException, DocumentException 
        {
               PdfPTable Dos_cinco = new PdfPTable(5);  
                Dos_cinco.setWidths(new int[]{2,2,3,2,3});
                PdfPCell Titulo_tabla = new PdfPCell(new Phrase("Actividad 2.5.2"
                        + " - Derechos de Autor",encabezadost));
                PdfPCell Num_Actividad = new PdfPCell(new Phrase("Número de Actividad"));
                PdfPCell Tipo_Actividad = new PdfPCell(new Phrase("Tipo de Actividad"));
                PdfPCell Ruta_alm = new PdfPCell(new Phrase("Ver archivo"));
                PdfPCell Puntos = new PdfPCell(new Phrase("Puntos obtenidos"));
                PdfPCell Observaciones = new PdfPCell(new Phrase("Observaciones"));
                PdfPCell celda=new PdfPCell();
                
                
                Titulo_tabla.setHorizontalAlignment(Element.ALIGN_CENTER);
                Titulo_tabla.setVerticalAlignment(Element.ALIGN_MIDDLE);
                Titulo_tabla.setBackgroundColor(new BaseColor(153, 0, 76));
                Titulo_tabla.setColspan(5);
                Titulo_tabla.setExtraParagraphSpace(15f);
                Dos_cinco.addCell(Titulo_tabla);
                
                Num_Actividad.setHorizontalAlignment(Element.ALIGN_CENTER);
                Num_Actividad.setVerticalAlignment(Element.ALIGN_MIDDLE);
                Dos_cinco.addCell(Num_Actividad);

                Tipo_Actividad.setHorizontalAlignment(Element.ALIGN_CENTER);
                Tipo_Actividad.setVerticalAlignment(Element.ALIGN_MIDDLE);
                Dos_cinco.addCell(Tipo_Actividad);

                Ruta_alm.setHorizontalAlignment(Element.ALIGN_CENTER);
                Ruta_alm.setVerticalAlignment(Element.ALIGN_MIDDLE);
                Dos_cinco.addCell(Ruta_alm);

                Puntos.setHorizontalAlignment(Element.ALIGN_CENTER);
                Puntos.setVerticalAlignment(Element.ALIGN_MIDDLE);
                Dos_cinco.addCell(Puntos);

                Observaciones.setHorizontalAlignment(Element.ALIGN_CENTER);
                Observaciones.setVerticalAlignment(Element.ALIGN_MIDDLE);
                Dos_cinco.addCell(Observaciones);

                /*Aqui van las consultas de las Actividades del profesor*/
               
                
                
                Dos_cinco.addCell("2.1.1");
                Dos_cinco.addCell("Alumno BEIFI");
                Dos_cinco.addCell("Hipervinculo");
                Dos_cinco.addCell("50");
                Dos_cinco.addCell("-");
                
                return Dos_cinco;
        }
        
        private static PdfPTable dospuntoonce() throws BadElementException, DocumentException 
        {
                PdfPTable Dos_once = new PdfPTable(5);  
                Dos_once.setWidths(new int[]{2,2,3,2,3});
                PdfPCell Titulo_tabla = new PdfPCell(new Phrase("Actividad 2.11"
                        + " - Direcciones y Codirecciones",encabezadost));
                PdfPCell Num_Actividad = new PdfPCell(new Phrase("Número de Actividad"));
                PdfPCell Tipo_Actividad = new PdfPCell(new Phrase("Tipo de Actividad"));
                PdfPCell Ruta_alm = new PdfPCell(new Phrase("Ver archivo"));
                PdfPCell Puntos = new PdfPCell(new Phrase("Puntos obtenidos"));
                PdfPCell Observaciones = new PdfPCell(new Phrase("Observaciones"));
                PdfPCell celda=new PdfPCell();
                
                
                Titulo_tabla.setHorizontalAlignment(Element.ALIGN_CENTER);
                Titulo_tabla.setVerticalAlignment(Element.ALIGN_MIDDLE);
                Titulo_tabla.setBackgroundColor(new BaseColor(153, 0, 76));
                Titulo_tabla.setColspan(5);
                Titulo_tabla.setExtraParagraphSpace(15f);
                Dos_once.addCell(Titulo_tabla);
                
                Num_Actividad.setHorizontalAlignment(Element.ALIGN_CENTER);
                Num_Actividad.setVerticalAlignment(Element.ALIGN_MIDDLE);
                Dos_once.addCell(Num_Actividad);

                Tipo_Actividad.setHorizontalAlignment(Element.ALIGN_CENTER);
                Tipo_Actividad.setVerticalAlignment(Element.ALIGN_MIDDLE);
                Dos_once.addCell(Tipo_Actividad);

                Ruta_alm.setHorizontalAlignment(Element.ALIGN_CENTER);
                Ruta_alm.setVerticalAlignment(Element.ALIGN_MIDDLE);
                Dos_once.addCell(Ruta_alm);

                Puntos.setHorizontalAlignment(Element.ALIGN_CENTER);
                Puntos.setVerticalAlignment(Element.ALIGN_MIDDLE);
                Dos_once.addCell(Puntos);

                Observaciones.setHorizontalAlignment(Element.ALIGN_CENTER);
                Observaciones.setVerticalAlignment(Element.ALIGN_MIDDLE);
                Dos_once.addCell(Observaciones);

                /*Aqui van las consultas de las Actividades del profesor*/
               
                
                
                Dos_once.addCell("2.1.1");
                Dos_once.addCell("Alumno BEIFI");
                Dos_once.addCell("Hipervinculo");
                Dos_once.addCell("50");
                Dos_once.addCell("-");
                
                return Dos_once;
        }
        
        
        private static PdfPTable dospuntodoce() throws BadElementException, DocumentException 
        {
                PdfPTable Dos_doce = new PdfPTable(5);  
                Dos_doce.setWidths(new int[]{2,2,3,2,3});
                PdfPCell Titulo_tabla = new PdfPCell(new Phrase("Actividad 2.12"
                        + " - Coordinación o Participación en la elaboración o actualización"
                        + "de un plan de estudios",encabezadost));
                PdfPCell Num_Actividad = new PdfPCell(new Phrase("Número de Actividad"));
                PdfPCell Tipo_Actividad = new PdfPCell(new Phrase("Tipo de Actividad"));
                PdfPCell Ruta_alm = new PdfPCell(new Phrase("Ver archivo"));
                PdfPCell Puntos = new PdfPCell(new Phrase("Puntos obtenidos"));
                PdfPCell Observaciones = new PdfPCell(new Phrase("Observaciones"));
                PdfPCell celda=new PdfPCell();
                
                
                Titulo_tabla.setHorizontalAlignment(Element.ALIGN_CENTER);
                Titulo_tabla.setVerticalAlignment(Element.ALIGN_MIDDLE);
                Titulo_tabla.setBackgroundColor(new BaseColor(153, 0, 76));
                Titulo_tabla.setColspan(5);
                Titulo_tabla.setExtraParagraphSpace(15f);
                Dos_doce.addCell(Titulo_tabla);
                
                Num_Actividad.setHorizontalAlignment(Element.ALIGN_CENTER);
                Num_Actividad.setVerticalAlignment(Element.ALIGN_MIDDLE);
                Dos_doce.addCell(Num_Actividad);

                Tipo_Actividad.setHorizontalAlignment(Element.ALIGN_CENTER);
                Tipo_Actividad.setVerticalAlignment(Element.ALIGN_MIDDLE);
                Dos_doce.addCell(Tipo_Actividad);

                Ruta_alm.setHorizontalAlignment(Element.ALIGN_CENTER);
                Ruta_alm.setVerticalAlignment(Element.ALIGN_MIDDLE);
                Dos_doce.addCell(Ruta_alm);

                Puntos.setHorizontalAlignment(Element.ALIGN_CENTER);
                Puntos.setVerticalAlignment(Element.ALIGN_MIDDLE);
                Dos_doce.addCell(Puntos);

                Observaciones.setHorizontalAlignment(Element.ALIGN_CENTER);
                Observaciones.setVerticalAlignment(Element.ALIGN_MIDDLE);
                Dos_doce.addCell(Observaciones);

                /*Aqui van las consultas de las Actividades del profesor*/
               
                
                
                Dos_doce.addCell("2.1.1");
                Dos_doce.addCell("Alumno BEIFI");
                Dos_doce.addCell("Hipervinculo");
                Dos_doce.addCell("50");
                Dos_doce.addCell("-");
                
                return Dos_doce;
        }
        
        
        private static void createList(Section subCatPart) {
                List list = new List(true, false, 10);
                list.add(new ListItem("First point"));
                list.add(new ListItem("Second point"));
                list.add(new ListItem("Third point"));
                subCatPart.add(list);
        }

        private static void addEmptyLine(Paragraph paragraph, int number) {
                for (int i = 0; i < number; i++) {
                        paragraph.add(new Paragraph(" "));
                }
        }
}