//Testbench Recorrido Izquierda a Derecha

`timescale 1 ns / 1 ps

module izq_der_tb;

    reg [7:0] a, b;
    wire w, z;

    localparam period = 10;

    //Dispositivo en prueba
    Comparador DUT (.wordA(a), .wordB(b), .w(w), .z(z));

    initial
        begin
            $dumpfile("izq_der_tb.vcd");
            $dumpvars(1, izq_der_tb);

            a = 000;
            b = 000;
            #period;

            if((w != 0) || (z != 1))
            begin
                $display("Test failed for A0 = B0");
            end

            a = 110;
            b = 001;
            #period

            if((w != 1) || (z != 0))
            begin
                $display("Test failed for A1 > B1");
            end
            else

            a = 111;
            b = 001;
            #period

            if((w != 1) || (z != 0))
            begin
                $display("Test failed for A2 > B2");
            end
            
            a = 000;
            b = 001;
            #period

            if((w != 0) || (z != 1))
            begin
                $display("Test failed for A3 < B3");
            end

            a = 011;
            b = 000;
            #period

            if((w != 1) || (z != 0))
            begin
                $display("Test failed for A4 > B4");
            end

            a = 11100111;
            b = 10000001;
            #period

            if((w != 1) || (z != 0))
            begin
                $display("Test failed for A5 > B5");
            end

        end
endmodule // izq_der_tb