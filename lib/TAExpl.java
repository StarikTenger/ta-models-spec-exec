//package tlc2.overrides;
//import org.apache.commons.lang3.StringUtils;

/*import tla2sany.semantic.ExprOrOpArgNode;
import tlc2.output.EC;
import tlc2.tool.EvalControl;
import tlc2.tool.EvalException;
import tlc2.tool.TLCState;
import tlc2.tool.coverage.CostModel;
import tlc2.tool.impl.Tool;
import tlc2.util.Context;
import tlc2.value.IValue;
import tlc2.value.impl.OpValue;
import tlc2.value.impl.SetEnumValue;
import tlc2.value.impl.StringValue;
import tlc2.value.impl.TupleValue;
import tlc2.value.impl.ValueVec;
import tlc2.value.impl.RecordValue;*/

import tlc2.value.impl.Value;
//import tlc2.value.Values;
import tlc2.value.impl.BoolValue;
import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.File;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public final class TAExpl {
    private static String DETECTPATH = "/Users/benjaminbinder/Desktop/These/timing-anomalies/tla/OoO/detection_procedure/";

    private static String filebase;
    private static String outputFile;
    private static Object mutex = new Object();

    private TAExpl () {}
    
    public static Value InitOutputFile(final Value bench, final Value _missLat, final Value _superscal, final Value _RSsize, final Value _robSize, final Value _lat, final Value _mayDMiss) throws IOException, InterruptedException {
        Matcher m = Pattern.compile("(\\d+)").matcher(_lat.toString());
        /*String lat_str = "";
        if (m.find()) {
            lat_str += m.group(0);
        }
        while (m.find()) {
            lat_str += "-"+m.group(0);
        } //(alu-read-write-div-mult)*/
        
        filebase = DETECTPATH+"tlc_graphs/"+bench.toString().replace("\"", "");
        outputFile = filebase+".txt";
        System.out.println(outputFile);
        File file = new File(outputFile);
        //file.delete();
        if (file.exists()) {
            System.out.println("Delete/rename the output file first!");
            return BoolValue.ValFalse;
        }
        
        BufferedWriter bfw = new BufferedWriter(new FileWriter(new File(outputFile)));
        bfw.write("missLat="+_missLat.toString()+"\nsuperscal="+_superscal.toString()+"\nRSsize="+_RSsize.toString()+"\nrobSize="+_robSize.toString()+"\nlat="+_lat.toString()+"\nmayDMiss="+_mayDMiss.toString()+"\n\n");
        bfw.close();
        return BoolValue.ValTrue;
    }
    
	public static Value HasTA(final Value g1, final Value g2, final Value cycle, final BoolValue onlyCom) throws IOException, InterruptedException {
            String prog = DETECTPATH+"graph_generator_tlc.py";
	    if (onlyCom.val)
                prog = DETECTPATH+"graph_generator_tlc_only_com.py";
	        
	    ProcessBuilder processBuilder = new ProcessBuilder("python", prog, g1.toString(), g2.toString(), filebase, cycle.toString());
        processBuilder.redirectErrorStream(true);

        Process process = processBuilder.start();
        int exitCode = process.waitFor();
        
        BufferedReader bfr = new BufferedReader(new InputStreamReader(process.getInputStream()));
        String line = "";
        synchronized (mutex) {
            BufferedWriter bfw = new BufferedWriter(new FileWriter(new File(outputFile), true));
            while ((line = bfr.readLine()) != null) {
                //System.out.println(line);
                bfw.write(line+"\n");
            }
            bfw.close();
        }
        
        if (exitCode == 1)
            return BoolValue.ValTrue;
        else
	        return BoolValue.ValFalse;
	        
	    /*RecordValue g1Elems = (RecordValue) g1.toRcd();
		Value nodes1Val = g1Elems.apply(new StringValue("nodes"), 0);
		TupleValue tv = (TupleValue) nodes1Val.toTuple();
		Value[] nodes1 = tv.elems;
	    System.out.println(nodes1[0]);*/
	}
}

