

import java.io.*;

import java.util.*;

import java.text.SimpleDateFormat;


import org.jlab.io.hipo.*;

import org.jlab.io.base.DataEvent;

import org.jlab.io.base.DataBank;

import org.jlab.io.hipo.HipoDataSource;


public class filter_pid11{

        HipoDataSync writer;

        String fileout;

        public filter_pid11(String reqFileout){

                fileout=reqFileout;

        }   

        public void open(HipoDataSource reader){

                writer = reader.createWriter();

                writer.open(fileout);

        }   

        public void writeout(DataEvent event){

                writer.writeEvent(event);

        }   

        public void close_all(){

                writer.close();

        }   

        public static void main(String[] args) {

                System.setProperty("java.awt.headless", "true");

                File fileIn = new File(args[0]);

                int evntMAX = 1000000000;

                filter_pid11 ana = new filter_pid11(args[1]);

                int evntot=0;

                int writtenout=0;

                java.util.Date date1 = new java.util.Date();

                System.out.println(date1);

                long startTime = System.currentTimeMillis();

                long previousTime = System.currentTimeMillis();

                SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");

                HipoDataSource reader = new HipoDataSource();

                reader.open(fileIn);

                ana.open(reader);

                while(reader.hasEvent() && evntot<evntMAX){

                        DataEvent event = reader.gotoEvent(evntot);

                        evntot++;

                        if(evntot%10000 == 0){ 

                                long nowTime = System.currentTimeMillis();

                                long elapsedTime = nowTime - previousTime;

                                long totalTime = nowTime - startTime;

                                elapsedTime = elapsedTime/1000;

                                totalTime = totalTime/1000;

                                Date date = new Date();

                                String timeMess = " ; time: " + dateFormat.format(date) +  " , last elapsed : " + elapsedTime + "s ; total elapsed : "+ totalTime + "s ;";

                                float fracval = 0f; 

                                if(evntot>0)fracval = 100f*writtenout/(1f*evntot);

                                String frac = String.format("fraction of phys events : %1.1f",fracval);

                                String printstat = evntot/1000+"k events ; ";

                                if(writtenout>1000)printstat += +writtenout/1000+"k track events found ; ";

                                else printstat += +writtenout+" track events found ; ";

                                System.out.println(printstat+frac+"%"+timeMess);

                                previousTime = nowTime;

                        }   

                        if( event.hasBank("REC::Particle") ){


                                boolean isSelected = false;

                                DataBank partBank = event.getBank("REC::Particle");

                                for(int ip=0;ip<partBank.rows() && !isSelected;ip++){

                                        if(partBank.getInt("pid",ip)==11 && Math.abs(partBank.getShort("status", ip))>=2000 && Math.abs(partBank.getShort("status", ip))<=4000 ){                                
//                                         if(partBank.getInt("pid",ip)==11 && partBank.getShort("status", ip)>2000 && partBank.getShort("status", ip)<4000 ){
//                                         if(partBank.getInt("pid",ip)==11 ){
//                                 System.out.println("pid "+partBank.getInt("pid",ip)+" "+partBank.getShort("status", ip));

                                                isSelected=true;

                                                writtenout++;

                                                ana.writeout(event);

                                        }

                                }

                        }

                        else if(event.hasBank("RECHB::Particle") ){

                                boolean isSelected = false;

                                DataBank partBank = event.getBank("RECHB::Particle");

                                for(int ip=0;ip<partBank.rows() && !isSelected;ip++){

                                        if(partBank.getInt("pid",ip)==11 && Math.abs(partBank.getShort("status", ip))>=2000 && Math.abs(partBank.getShort("status", ip))<=4000 ){                                                                
//                                         if(partBank.getInt("pid",ip)==11 && partBank.getShort("status", ip)>2000 && partBank.getShort("status", ip)<4000 ){
//                                         if(partBank.getInt("pid",ip)==11 ){
//                                 System.out.println("pid "+partBank.getInt("pid",ip)+" "+partBank.getShort("status", ip));


                                                isSelected=true;

                                                writtenout++;

                                                ana.writeout(event);

                                        }

                                }

                        }

                }

                reader.close();

                java.util.Date date2 = new java.util.Date();

                long difference = date2.getTime() - date1.getTime();

                System.out.println("... done looping over events");

                System.out.println(date1);

                System.out.println(date2);

                System.out.printf("Processing time = %1.2f s\n",difference*0.001);

                String printstat = evntot/1000+"k total ; "+writtenout/1000+"k trigged events found ; ";

                System.out.println(printstat);

                ana.close_all();

                System.out.println("Bye.");

        }

}
