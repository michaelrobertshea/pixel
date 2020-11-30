/*
Michael Shea
Independent Study for COMP300 Fall 2020
Dr. Pateros
NeoPixel Illumination With TinyBX Board
11-29-2020
*/



`include "neopixel.vh"

// look in pins.pcf for all the pin names on the TinyFPGA BX board
module top (
    input CLK,    // 16MHz clock
    output USBPU, // User/boot LED next to power LED
    output PIN_5  // Output will be sent to pin 5
);
    // drive USB pull-up resistor to '0' to disable USB
    //assign USBPU = 0;

    //regesters for each color value(red,green,blue)
    reg [7:0] r_data = 0;
    reg [7:0] g_data = 0;
    reg [7:0] b_data = 0;


    //regesters for each neopixel
    wire [23:0] data1 = {8'b000, r_data, 8'b000};
    wire [23:0] data2 = {g_data, 8'b000, 8'b000};
    wire [23:0] data3 = {8'b000, 8'b000, b_data};
    wire [23:0] data4 = {8'b000, r_data, 8'b000};
    wire [23:0] data5 = {g_data, 8'b000, 8'b000};
    wire [23:0] data6 = {8'b000, 8'b000, b_data};
    wire [23:0] data7 = {8'b000, r_data, 8'b000};
    wire [23:0] data8 = {g_data, 8'b000, 8'b000};

    wire [23:0] data9 = {8'b000, r_data, 8'b000};
    wire [23:0] data10 = {g_data, 8'b000, 8'b000};
    wire [23:0] data11 = {8'b000, 8'b000, b_data};
    wire [23:0] data12 = {8'b000, r_data, 8'b000};
    wire [23:0] data13 = {g_data, 8'b000, 8'b000};
    wire [23:0] data14 = {8'b000, 8'b000, b_data};
    wire [23:0] data15 = {8'b000, r_data, 8'b000};
    wire [23:0] data16 = {g_data, 8'b000, 8'b000};

    wire [23:0] data17 = {8'b000, r_data, 8'b000};
    wire [23:0] data18 = {g_data, 8'b000, 8'b000};
    wire [23:0] data19 = {8'b000, 8'b000, b_data};
    wire [23:0] data20 = {8'b000, r_data, 8'b000};
    wire [23:0] data21 = {g_data, 8'b000, 8'b000};
    wire [23:0] data22 = {8'b000, 8'b000, b_data};
    wire [23:0] data23 = {8'b000, r_data, 8'b000};
    wire [23:0] data24 = {g_data, 8'b000, 8'b000};


    wire start_tx;

    neopixel #(24) test(
      .clk_16MHz(CLK),
      .dout(PIN_5),
      .data_in({data1, data2, data3, data4, data5, data6, data7, data8,
                data9, data10, data11, data12, data13, data14, data15, data16,
                data17, data18, data19, data20, data21, data22, data23, data24
        }),
      .start_tx(start_tx)
    );


    /*parameter  speeds either speeds up or slows down this program. the lower this value the faster it will go. 
    the slowdown allows for the pixel to turn off and reset between turns
    */

    localparam Speed = 18;
    reg [Speed:0] counter = 0;
    always @(posedge CLK)
      counter <= counter + 1;
    assign start_tx = counter[Speed];

    always @ (negedge start_tx) begin
        if (r_data < 100) begin
           r_data <= r_data + 1;
        end else if (g_data < 100) begin
           g_data <= g_data + 1;
        end else if (b_data < 100) begin
           b_data <= b_data + 1;
        end else begin
           r_data <= 0;
           g_data <= 0;
           b_data <= 0;
        end
        $display(counter);
    end

endmodule
