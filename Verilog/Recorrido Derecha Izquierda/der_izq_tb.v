// Testbench Recorrido Derecha Izquierda

`timescale 1 ns / 1 ps

module der_izq_tb;

    reg [2:0] a, b;
    wire z;

    localparam period = 10;

    //Dispositivo en prueba
    Comparador DUT (.wordA(a), .wordB(b), .z(z));

    initial
        begin
            $dumpfile("der_izq_tb.vcd");
            $dumpvars(1, der_izq_tb);

            a = 000;
            b = 000;
            #period;

            if(z != 1)
            begin
                $display("Test failed for A0 = B0");
            end

            a = 110;
            b = 001;
            #period

            if(z != 0)
            begin
                $display("Test failed for A1 > B1");
            end

            a = 111;
            b = 001;
            #period

            if(z != 0)
            begin
                $display("Test failed for A2 > B2");
            end
            
            a = 000;
            b = 001;
            #period

            if(z != 1)
            begin
                $display("Test failed for A3 < B3");
            end

            a = 1011;
            b = 1000;
            #period

            if(z != 0)
            begin
                $display("Test failed for A4 > B4");
            end

            a = 11100111;
            b = 10000001;
            #period

            if(z != 0)
            begin
                $display("Test failed for A5 > B5");
            end

        end
endmodule // der_izq_tb