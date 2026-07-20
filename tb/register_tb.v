module register_tb();
    reg clk;
    reg rst;
    reg wr_en;

    reg [2:0] wr_addr;
    reg [7:0] wr_data;
    reg [2:0] rd_addr;

    wire [7:0] rd_data;

    register uut(
        .clk(clk),
        .rst(rst),
        .wr_en(wr_en),
        .wr_addr(wr_addr),
        .wr_data(wr_data),
        .rd_addr(rd_addr),
        .rd_data(rd_data)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        $dumpfile("wave.vcd");
        $dumpvars(0,register_tb);

        rst = 1;
        wr_en = 0;
        wr_addr = 0;
        wr_data = 0;
        rd_addr = 0;

        #20;

        rst = 0;

        wr_en = 1;
        wr_addr = 3'b011;
        wr_data = 8'b10101010;

        #10;
        wr_en = 0;

        rd_addr = 3'b011;

        #20;
        $finish;
    end

endmodule

