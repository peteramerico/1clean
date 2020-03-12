%plotando as interfaces fixadas que encontramos
    dz=0.01;
    xfinal=25.850;
%para plotar a primeira interface:
if exist('ini1.txt','file');
    ini1=load('ini1.txt');
    ini11=ini1;
    ini11(:,1)=0:0.05:xfinal;
    ini111=ini11;
    ini111(:,2)=(ini11(:,2)*dz)-dz;
    %figure()
    plot(ini111(:,1),ini111(:,2),'k','LineWidth',1.1)
    %plot(c1(:,1),c1(:,2),'k')
    set(gca, 'YDir','reverse')
end
%para plotar a segunda interface:
if exist('ini2.txt','file');
    ini2=load('ini2.txt');
    ini22=ini2;
    ini22(:,1)=0:0.05:xfinal;
    ini222=ini22;
    ini222(:,2)=(ini22(:,2)*dz)-dz;
    %figure()
    plot(ini222(:,1),ini222(:,2),'k','LineWidth',1.1)
    %plot(c1(:,1),c1(:,2),'k')
    set(gca, 'YDir','reverse')
end
%para plotar a terceira interface:
if exist('ini3.txt','file');
    ini3=load('ini3.txt');
    ini33=ini3;
    ini33(:,1)=0:0.05:xfinal;
    ini333=ini33;
    ini333(:,2)=(ini33(:,2)*dz)-dz;
    %figure()
    plot(ini333(:,1),ini333(:,2),'k','LineWidth',1.1)
    %plot(c1(:,1),c1(:,2),'k')
    set(gca, 'YDir','reverse')
end
if exist('iniaqui.txt','file');
    iniaqui=load('iniaqui.txt');
    iniaqui1=iniaqui;
    iniaqui1(:,1)=0:0.05:xfinal;
    iniaqui11=iniaqui1;
    iniaqui11(:,2)=(iniaqui1(:,2)*dz)-dz;
    %figure()
    plot(iniaqui11(:,1),iniaqui11(:,2),'k','LineWidth',1.1)
    %plot(c1(:,1),c1(:,2),'k')
    set(gca, 'YDir','reverse')
end
hold on
c1=[0.0000,0.0000;0.0501,0.0000;0.1002,0.0000;0.1503,0.0000;0.2004,0.0000;0.2505,0.0000;0.3006,0.0000;0.3507,0.0000;0.4008,0.0000;0.4509,0.0000;0.5010,0.0000;0.5511,0.0000;0.6012,0.0000;0.6513,0.0000;0.7014,0.0000;0.7515,0.0000;0.8016,0.0000;0.8516,0.0000;0.9017,0.0000;0.9518,0.0000;1.0019,0.0000;1.0520,0.0000;1.1021,0.0000;1.1522,0.0000;1.2023,0.0000;1.2524,0.0000;1.3025,0.0000;1.3526,0.0000;1.4027,0.0000;1.4528,0.0000;1.5029,0.0000;1.5530,0.0000;1.6031,0.0000;1.6532,0.0000;1.7033,0.0000;1.7534,0.0000;1.8035,0.0000;1.8536,0.0000;1.9037,0.0000;1.9538,0.0000;2.0039,0.0000;2.0540,0.0000;2.1041,0.0000;2.1542,0.0000;2.2043,0.0000;2.2544,0.0000;2.3045,0.0000;2.3546,0.0000;2.4047,0.0000;2.4547,0.0000;2.5048,0.0000;2.5549,0.0000;2.6050,0.0000;2.6551,0.0000;2.7052,0.0000;2.7553,0.0000;2.8054,0.0000;2.8555,0.0000;2.9056,0.0000;2.9557,0.0000;3.0058,0.0000;3.0559,0.0000;3.1060,0.0000;3.1561,0.0000;3.2062,0.0000;3.2563,0.0000;3.3064,0.0000;3.3565,0.0000;3.4066,0.0000;3.4567,0.0000;3.5068,0.0000;3.5569,0.0000;3.6070,0.0000;3.6571,0.0000;3.7072,0.0000;3.7573,0.0000;3.8074,0.0000;3.8575,0.0000;3.9076,0.0000;3.9577,0.0000;4.0078,0.0000;4.0578,0.0000;4.1079,0.0000;4.1580,0.0000;4.2081,0.0000;4.2582,0.0000;4.3083,0.0000;4.3584,0.0000;4.4085,0.0000;4.4586,0.0000;4.5087,0.0000;4.5588,0.0000;4.6089,0.0000;4.6590,0.0000;4.7091,0.0000;4.7592,0.0000;4.8093,0.0000;4.8594,0.0000;4.9095,0.0000;4.9596,0.0000;5.0097,0.0000;5.0598,0.0000;5.1099,0.0000;5.1600,0.0000;5.2101,0.0000;5.2602,0.0000;5.3103,0.0000;5.3604,0.0000;5.4105,0.0000;5.4606,0.0000;5.5107,0.0000;5.5608,0.0000;5.6109,0.0000;5.6609,0.0000;5.7110,0.0000;5.7611,0.0000;5.8112,0.0000;5.8613,0.0000;5.9114,0.0000;5.9615,0.0000;6.0116,0.0000;6.0617,0.0000;6.1118,0.0000;6.1619,0.0000;6.2120,0.0000;6.2621,0.0000;6.3122,0.0000;6.3623,0.0000;6.4124,0.0000;6.4625,0.0000;6.5126,0.0000;6.5627,0.0000;6.6128,0.0000;6.6629,0.0000;6.7130,0.0000;6.7631,0.0000;6.8132,0.0000;6.8633,0.0000;6.9134,0.0000;6.9635,0.0000;7.0136,0.0000;7.0637,0.0000;7.1138,0.0000;7.1639,0.0000;7.2140,0.0000;7.2641,0.0000;7.3141,0.0000;7.3642,0.0000;7.4143,0.0000;7.4644,0.0000;7.5145,0.0000;7.5646,0.0000;7.6147,0.0000;7.6648,0.0000;7.7149,0.0000;7.7650,0.0000;7.8151,0.0000;7.8652,0.0000;7.9153,0.0000;7.9654,0.0000;8.0155,0.0000;8.0656,0.0000;8.1157,0.0000;8.1658,0.0000;8.2159,0.0000;8.2660,0.0000;8.3161,0.0000;8.3662,0.0000;8.4163,0.0000;8.4664,0.0000;8.5165,0.0000;8.5666,0.0000;8.6167,0.0000;8.6668,0.0000;8.7169,0.0000;8.7670,0.0000;8.8171,0.0000;8.8672,0.0000;8.9172,0.0000;8.9673,0.0000;9.0174,0.0000;9.0675,0.0000;9.1176,0.0000;9.1677,0.0000;9.2178,0.0000;9.2679,0.0000;9.3180,0.0000;9.3681,0.0000;9.4182,0.0000;9.4683,0.0000;9.5184,0.0000;9.5685,0.0000;9.6186,0.0000;9.6687,0.0000;9.7188,0.0000;9.7689,0.0000;9.8190,0.0000;9.8691,0.0000;9.9192,0.0000;9.9693,0.0000;10.0194,0.0000;10.0695,0.0000;10.1196,0.0000;10.1697,0.0000;10.2198,0.0000;10.2699,0.0000;10.3200,0.0000;10.3701,0.0000;10.4202,0.0000;10.4703,0.0000;10.5203,0.0000;10.5704,0.0000;10.6205,0.0000;10.6706,0.0000;10.7207,0.0000;10.7708,0.0000;10.8209,0.0000;10.8710,0.0000;10.9211,0.0000;10.9712,0.0000;11.0213,0.0000;11.0714,0.0000;11.1215,0.0000;11.1716,0.0000;11.2217,0.0000;11.2718,0.0000;11.3219,0.0000;11.3720,0.0000;11.4221,0.0000;11.4722,0.0000;11.5223,0.0000;11.5724,0.0000;11.6225,0.0000;11.6726,0.0000;11.7227,0.0000;11.7728,0.0000;11.8229,0.0000;11.8730,0.0000;11.9231,0.0000;11.9732,0.0000;12.0233,0.0000;12.0734,0.0000;12.1235,0.0000;12.1735,0.0000;12.2236,0.0000;12.2737,0.0000;12.3238,0.0000;12.3739,0.0000;12.4240,0.0000;12.4741,0.0000;12.5242,0.0000;12.5743,0.0000;12.6244,0.0000;12.6745,0.0000;12.7246,0.0000;12.7747,0.0000;12.8248,0.0000;12.8749,0.0000;12.9250,0.0000;12.9751,0.0000;13.0252,0.0000;13.0753,0.0000;13.1254,0.0000;13.1755,0.0000;13.2256,0.0000;13.2757,0.0000;13.3258,0.0000;13.3759,0.0000;13.4260,0.0000;13.4761,0.0000;13.5262,0.0000;13.5763,0.0000;13.6264,0.0000;13.6765,0.0000;13.7266,0.0000;13.7766,0.0000;13.8267,0.0000;13.8768,0.0000;13.9269,0.0000;13.9770,0.0000;14.0271,0.0000;14.0772,0.0000;14.1273,0.0000;14.1774,0.0000;14.2275,0.0000;14.2776,0.0000;14.3277,0.0000;14.3778,0.0000;14.4279,0.0000;14.4780,0.0000;14.5281,0.0000;14.5782,0.0000;14.6283,0.0000;14.6784,0.0000;14.7285,0.0000;14.7786,0.0000;14.8287,0.0000;14.8788,0.0000;14.9289,0.0000;14.9790,0.0000;15.0291,0.0000;15.0792,0.0000;15.1293,0.0000;15.1794,0.0000;15.2295,0.0000;15.2796,0.0000;15.3297,0.0000;15.3797,0.0000;15.4298,0.0000;15.4799,0.0000;15.5300,0.0000;15.5801,0.0000;15.6302,0.0000;15.6803,0.0000;15.7304,0.0000;15.7805,0.0000;15.8306,0.0000;15.8807,0.0000;15.9308,0.0000;15.9809,0.0000;16.0310,0.0000;16.0811,0.0000;16.1312,0.0000;16.1813,0.0000;16.2314,0.0000;16.2815,0.0000;16.3316,0.0000;16.3817,0.0000;16.4318,0.0000;16.4819,0.0000;16.5320,0.0000;16.5821,0.0000;16.6322,0.0000;16.6823,0.0000;16.7324,0.0000;16.7825,0.0000;16.8326,0.0000;16.8827,0.0000;16.9328,0.0000;16.9828,0.0000;17.0329,0.0000;17.0830,0.0000;17.1331,0.0000;17.1832,0.0000;17.2333,0.0000;17.2834,0.0000;17.3335,0.0000;17.3836,0.0000;17.4337,0.0000;17.4838,0.0000;17.5339,0.0000;17.5840,0.0000;17.6341,0.0000;17.6842,0.0000;17.7343,0.0000;17.7844,0.0000;17.8345,0.0000;17.8846,0.0000;17.9347,0.0000;17.9848,0.0000;18.0349,0.0000;18.0850,0.0000;18.1351,0.0000;18.1852,0.0000;18.2353,0.0000;18.2854,0.0000;18.3355,0.0000;18.3856,0.0000;18.4357,0.0000;18.4858,0.0000;18.5359,0.0000;18.5860,0.0000;18.6360,0.0000;18.6861,0.0000;18.7362,0.0000;18.7863,0.0000;18.8364,0.0000;18.8865,0.0000;18.9366,0.0000;18.9867,0.0000;19.0368,0.0000;19.0869,0.0000;19.1370,0.0000;19.1871,0.0000;19.2372,0.0000;19.2873,0.0000;19.3374,0.0000;19.3875,0.0000;19.4376,0.0000;19.4877,0.0000;19.5378,0.0000;19.5879,0.0000;19.6380,0.0000;19.6881,0.0000;19.7382,0.0000;19.7883,0.0000;19.8384,0.0000;19.8885,0.0000;19.9386,0.0000;19.9887,0.0000;20.0388,0.0000;20.0889,0.0000;20.1390,0.0000;20.1891,0.0000;20.2391,0.0000;20.2892,0.0000;20.3393,0.0000;20.3894,0.0000;20.4395,0.0000;20.4896,0.0000;20.5397,0.0000;20.5898,0.0000;20.6399,0.0000;20.6900,0.0000;20.7401,0.0000;20.7902,0.0000;20.8403,0.0000;20.8904,0.0000;20.9405,0.0000;20.9906,0.0000;21.0407,0.0000;21.0908,0.0000;21.1409,0.0000;21.1910,0.0000;21.2411,0.0000;21.2912,0.0000;21.3413,0.0000;21.3914,0.0000;21.4415,0.0000;21.4916,0.0000;21.5417,0.0000;21.5918,0.0000;21.6419,0.0000;21.6920,0.0000;21.7421,0.0000;21.7922,0.0000;21.8422,0.0000;21.8923,0.0000;21.9424,0.0000;21.9925,0.0000;22.0426,0.0000;22.0927,0.0000;22.1428,0.0000;22.1929,0.0000;22.2430,0.0000;22.2931,0.0000;22.3432,0.0000;22.3933,0.0000;22.4434,0.0000;22.4935,0.0000;22.5436,0.0000;22.5937,0.0000;22.6438,0.0000;22.6939,0.0000;22.7440,0.0000;22.7941,0.0000;22.8442,0.0000;22.8943,0.0000;22.9444,0.0000;22.9945,0.0000;23.0446,0.0000;23.0947,0.0000;23.1448,0.0000;23.1949,0.0000;23.2450,0.0000;23.2951,0.0000;23.3452,0.0000;23.3953,0.0000;23.4453,0.0000;23.4954,0.0000;23.5455,0.0000;23.5956,0.0000;23.6457,0.0000;23.6958,0.0000;23.7459,0.0000;23.7960,0.0000;23.8461,0.0000;23.8962,0.0000;23.9463,0.0000;23.9964,0.0000;24.0465,0.0000;24.0966,0.0000;24.1467,0.0000;24.1968,0.0000;24.2469,0.0000;24.2970,0.0000;24.3471,0.0000;24.3972,0.0000;24.4473,0.0000;24.4974,0.0000;24.5475,0.0000;24.5976,0.0000;24.6477,0.0000;24.6978,0.0000;24.7479,0.0000;24.7980,0.0000;24.8481,0.0000;24.8982,0.0000;24.9483,0.0000;24.9984,0.0000;25.0485,0.0000;25.0985,0.0000;25.1486,0.0000;25.1987,0.0000;25.2488,0.0000;25.2989,0.0000;25.3490,0.0000;25.3991,0.0000;25.4492,0.0000;25.4993,0.0000;25.5494,0.0000;25.5995,0.0000;25.6496,0.0000;25.6997,0.0000;25.7498,0.0000;25.7999,0.0000;25.8500,0.0000];
plot(c1(:,1),c1(:,2),'k')
set(gca, 'YDir','reverse')
hold on
c2=[0.0000,0.3000;0.0501,0.3000;0.1002,0.3000;0.1503,0.3000;0.2004,0.3000;0.2505,0.3000;0.3006,0.3000;0.3507,0.3000;0.4008,0.3000;0.4509,0.3000;0.5010,0.3000;0.5511,0.3000;0.6012,0.3000;0.6513,0.3000;0.7014,0.3000;0.7515,0.3000;0.8016,0.3000;0.8516,0.3000;0.9017,0.3000;0.9518,0.3000;1.0019,0.3000;1.0520,0.3000;1.1021,0.3000;1.1522,0.3000;1.2023,0.3000;1.2524,0.3000;1.3025,0.3000;1.3526,0.3000;1.4027,0.3000;1.4528,0.3000;1.5029,0.3000;1.5530,0.3000;1.6031,0.3000;1.6532,0.3000;1.7033,0.3000;1.7534,0.3000;1.8035,0.3000;1.8536,0.3000;1.9037,0.3000;1.9538,0.3000;2.0039,0.3000;2.0540,0.3000;2.1041,0.3000;2.1542,0.3000;2.2043,0.3000;2.2544,0.3000;2.3045,0.3000;2.3546,0.3000;2.4047,0.3000;2.4547,0.3000;2.5048,0.3000;2.5549,0.3000;2.6050,0.3000;2.6551,0.3000;2.7052,0.3000;2.7553,0.3000;2.8054,0.3000;2.8555,0.3000;2.9056,0.3000;2.9557,0.3000;3.0058,0.3000;3.0559,0.3000;3.1060,0.3000;3.1561,0.3000;3.2062,0.3000;3.2563,0.3000;3.3064,0.3000;3.3565,0.3000;3.4066,0.3000;3.4567,0.3000;3.5068,0.3000;3.5569,0.3000;3.6070,0.3000;3.6571,0.3000;3.7072,0.3000;3.7573,0.3000;3.8074,0.3000;3.8575,0.3000;3.9076,0.3000;3.9577,0.3000;4.0078,0.3000;4.0578,0.3000;4.1079,0.3000;4.1580,0.3000;4.2081,0.3000;4.2582,0.3000;4.3083,0.3000;4.3584,0.3000;4.4085,0.3000;4.4586,0.3000;4.5087,0.3000;4.5588,0.3000;4.6089,0.3000;4.6590,0.3000;4.7091,0.3000;4.7592,0.3000;4.8093,0.3000;4.8594,0.3000;4.9095,0.3000;4.9596,0.3000;5.0097,0.3000;5.0598,0.3000;5.1099,0.3000;5.1600,0.3000;5.2101,0.3000;5.2602,0.3000;5.3103,0.3000;5.3604,0.3000;5.4105,0.3000;5.4606,0.3000;5.5107,0.3000;5.5608,0.3000;5.6109,0.3000;5.6609,0.3000;5.7110,0.3000;5.7611,0.3000;5.8112,0.3000;5.8613,0.3000;5.9114,0.3000;5.9615,0.3000;6.0116,0.3000;6.0617,0.3000;6.1118,0.3000;6.1619,0.3000;6.2120,0.3000;6.2621,0.3000;6.3122,0.3000;6.3623,0.3000;6.4124,0.3000;6.4625,0.3000;6.5126,0.3000;6.5627,0.3000;6.6128,0.3000;6.6629,0.3000;6.7130,0.3000;6.7631,0.3000;6.8132,0.3000;6.8633,0.3000;6.9134,0.3000;6.9635,0.3000;7.0136,0.3000;7.0637,0.3000;7.1138,0.3000;7.1639,0.3000;7.2140,0.3000;7.2641,0.3000;7.3141,0.3000;7.3642,0.3000;7.4143,0.3000;7.4644,0.3000;7.5145,0.3000;7.5646,0.3000;7.6147,0.3000;7.6648,0.3000;7.7149,0.3000;7.7650,0.3000;7.8151,0.3000;7.8652,0.3000;7.9153,0.3000;7.9654,0.3000;8.0155,0.3000;8.0656,0.3000;8.1157,0.3000;8.1658,0.3000;8.2159,0.3000;8.2660,0.3000;8.3161,0.3000;8.3662,0.3000;8.4163,0.3000;8.4664,0.3000;8.5165,0.3000;8.5666,0.3000;8.6167,0.3000;8.6668,0.3000;8.7169,0.3000;8.7670,0.3000;8.8171,0.3000;8.8672,0.3000;8.9172,0.3000;8.9673,0.3000;9.0174,0.3000;9.0675,0.3000;9.1176,0.3000;9.1677,0.3000;9.2178,0.3000;9.2679,0.3000;9.3180,0.3000;9.3681,0.3000;9.4182,0.3000;9.4683,0.3000;9.5184,0.3000;9.5685,0.3000;9.6186,0.3000;9.6687,0.3000;9.7188,0.3000;9.7689,0.3000;9.8190,0.3000;9.8691,0.3000;9.9192,0.3000;9.9693,0.3000;10.0194,0.3000;10.0695,0.3000;10.1196,0.3000;10.1697,0.3000;10.2198,0.3000;10.2699,0.3000;10.3200,0.3000;10.3701,0.3000;10.4202,0.3000;10.4703,0.3000;10.5203,0.3000;10.5704,0.3000;10.6205,0.3000;10.6706,0.3000;10.7207,0.3000;10.7708,0.3000;10.8209,0.3000;10.8710,0.3000;10.9211,0.3000;10.9712,0.3000;11.0213,0.3000;11.0714,0.3000;11.1215,0.3000;11.1716,0.3000;11.2217,0.3000;11.2718,0.3000;11.3219,0.3000;11.3720,0.3000;11.4221,0.3000;11.4722,0.3000;11.5223,0.3000;11.5724,0.3000;11.6225,0.3000;11.6726,0.3000;11.7227,0.3000;11.7728,0.3000;11.8229,0.3000;11.8730,0.3000;11.9231,0.3000;11.9732,0.3000;12.0233,0.3000;12.0734,0.3000;12.1235,0.3000;12.1735,0.3000;12.2236,0.3000;12.2737,0.3000;12.3238,0.3000;12.3739,0.3000;12.4240,0.3000;12.4741,0.3000;12.5242,0.3000;12.5743,0.3000;12.6244,0.3000;12.6745,0.3000;12.7246,0.3000;12.7747,0.3000;12.8248,0.3000;12.8749,0.3000;12.9250,0.3000;12.9751,0.3000;13.0252,0.3000;13.0753,0.3000;13.1254,0.3000;13.1755,0.3000;13.2256,0.3000;13.2757,0.3000;13.3258,0.3000;13.3759,0.3000;13.4260,0.3000;13.4761,0.3000;13.5262,0.3000;13.5763,0.3000;13.6264,0.3000;13.6765,0.3000;13.7266,0.3000;13.7766,0.3000;13.8267,0.3000;13.8768,0.3000;13.9269,0.3000;13.9770,0.3000;14.0271,0.3000;14.0772,0.3000;14.1273,0.3000;14.1774,0.3000;14.2275,0.3000;14.2776,0.3000;14.3277,0.3000;14.3778,0.3000;14.4279,0.3000;14.4780,0.3000;14.5281,0.3000;14.5782,0.3000;14.6283,0.3000;14.6784,0.3000;14.7285,0.3000;14.7786,0.3000;14.8287,0.3000;14.8788,0.3000;14.9289,0.3000;14.9790,0.3000;15.0291,0.3000;15.0792,0.3000;15.1293,0.3000;15.1794,0.3000;15.2295,0.3000;15.2796,0.3000;15.3297,0.3000;15.3797,0.3000;15.4298,0.3000;15.4799,0.3000;15.5300,0.3000;15.5801,0.3000;15.6302,0.3000;15.6803,0.3000;15.7304,0.3000;15.7805,0.3000;15.8306,0.3000;15.8807,0.3000;15.9308,0.3000;15.9809,0.3000;16.0310,0.3000;16.0811,0.3000;16.1312,0.3000;16.1813,0.3000;16.2314,0.3000;16.2815,0.3000;16.3316,0.3000;16.3817,0.3000;16.4318,0.3000;16.4819,0.3000;16.5320,0.3000;16.5821,0.3000;16.6322,0.3000;16.6823,0.3000;16.7324,0.3000;16.7825,0.3000;16.8326,0.3000;16.8827,0.3000;16.9328,0.3000;16.9828,0.3000;17.0329,0.3000;17.0830,0.3000;17.1331,0.3000;17.1832,0.3000;17.2333,0.3000;17.2834,0.3000;17.3335,0.3000;17.3836,0.3000;17.4337,0.3000;17.4838,0.3000;17.5339,0.3000;17.5840,0.3000;17.6341,0.3000;17.6842,0.3000;17.7343,0.3000;17.7844,0.3000;17.8345,0.3000;17.8846,0.3000;17.9347,0.3000;17.9848,0.3000;18.0349,0.3000;18.0850,0.3000;18.1351,0.3000;18.1852,0.3000;18.2353,0.3000;18.2854,0.3000;18.3355,0.3000;18.3856,0.3000;18.4357,0.3000;18.4858,0.3000;18.5359,0.3000;18.5860,0.3000;18.6360,0.3000;18.6861,0.3000;18.7362,0.3000;18.7863,0.3000;18.8364,0.3000;18.8865,0.3000;18.9366,0.3000;18.9867,0.3000;19.0368,0.3000;19.0869,0.3000;19.1370,0.3000;19.1871,0.3000;19.2372,0.3000;19.2873,0.3000;19.3374,0.3000;19.3875,0.3000;19.4376,0.3000;19.4877,0.3000;19.5378,0.3000;19.5879,0.3000;19.6380,0.3000;19.6881,0.3000;19.7382,0.3000;19.7883,0.3000;19.8384,0.3000;19.8885,0.3000;19.9386,0.3000;19.9887,0.3000;20.0388,0.3000;20.0889,0.3000;20.1390,0.3000;20.1891,0.3000;20.2391,0.3000;20.2892,0.3000;20.3393,0.3000;20.3894,0.3000;20.4395,0.3000;20.4896,0.3000;20.5397,0.3000;20.5898,0.3000;20.6399,0.3000;20.6900,0.3000;20.7401,0.3000;20.7902,0.3000;20.8403,0.3000;20.8904,0.3000;20.9405,0.3000;20.9906,0.3000;21.0407,0.3000;21.0908,0.3000;21.1409,0.3000;21.1910,0.3000;21.2411,0.3000;21.2912,0.3000;21.3413,0.3000;21.3914,0.3000;21.4415,0.3000;21.4916,0.3000;21.5417,0.3000;21.5918,0.3000;21.6419,0.3000;21.6920,0.3000;21.7421,0.3000;21.7922,0.3000;21.8422,0.3000;21.8923,0.3000;21.9424,0.3000;21.9925,0.3000;22.0426,0.3000;22.0927,0.3000;22.1428,0.3000;22.1929,0.3000;22.2430,0.3000;22.2931,0.3000;22.3432,0.3000;22.3933,0.3000;22.4434,0.3000;22.4935,0.3000;22.5436,0.3000;22.5937,0.3000;22.6438,0.3000;22.6939,0.3000;22.7440,0.3000;22.7941,0.3000;22.8442,0.3000;22.8943,0.3000;22.9444,0.3000;22.9945,0.3000;23.0446,0.3000;23.0947,0.3000;23.1448,0.3000;23.1949,0.3000;23.2450,0.3000;23.2951,0.3000;23.3452,0.3000;23.3953,0.3000;23.4453,0.3000;23.4954,0.3000;23.5455,0.3000;23.5956,0.3000;23.6457,0.3000;23.6958,0.3000;23.7459,0.3000;23.7960,0.3000;23.8461,0.3000;23.8962,0.3000;23.9463,0.3000;23.9964,0.3000;24.0465,0.3000;24.0966,0.3000;24.1467,0.3000;24.1968,0.3000;24.2469,0.3000;24.2970,0.3000;24.3471,0.3000;24.3972,0.3000;24.4473,0.3000;24.4974,0.3000;24.5475,0.3000;24.5976,0.3000;24.6477,0.3000;24.6978,0.3000;24.7479,0.3000;24.7980,0.3000;24.8481,0.3000;24.8982,0.3000;24.9483,0.3000;24.9984,0.3000;25.0485,0.3000;25.0985,0.3000;25.1486,0.3000;25.1987,0.3000;25.2488,0.3000;25.2989,0.3000;25.3490,0.3000;25.3991,0.3000;25.4492,0.3000;25.4993,0.3000;25.5494,0.3000;25.5995,0.3000;25.6496,0.3000;25.6997,0.3000;25.7498,0.3000;25.7999,0.3000;25.8500,0.3000];
plot(c2(:,1),c2(:,2),'--w','LineWidth',1.1)
set(gca, 'YDir','reverse')
hold on
c3=[0.0000,0.9000;0.0501,0.9023;0.1002,0.9045;0.1503,0.9068;0.2004,0.9091;0.2505,0.9113;0.3006,0.9135;0.3507,0.9157;0.4008,0.9179;0.4509,0.9201;0.5010,0.9222;0.5511,0.9243;0.6012,0.9264;0.6513,0.9284;0.7014,0.9304;0.7515,0.9323;0.8016,0.9342;0.8516,0.9360;0.9017,0.9378;0.9518,0.9395;1.0019,0.9411;1.0520,0.9427;1.1021,0.9443;1.1522,0.9457;1.2023,0.9471;1.2524,0.9484;1.3025,0.9496;1.3526,0.9507;1.4027,0.9518;1.4528,0.9527;1.5029,0.9536;1.5530,0.9543;1.6031,0.9550;1.6532,0.9556;1.7033,0.9560;1.7534,0.9563;1.8035,0.9566;1.8536,0.9567;1.9037,0.9566;1.9538,0.9565;2.0039,0.9562;2.0540,0.9558;2.1041,0.9553;2.1542,0.9547;2.2043,0.9538;2.2544,0.9529;2.3045,0.9518;2.3546,0.9506;2.4047,0.9492;2.4547,0.9476;2.5048,0.9459;2.5549,0.9441;2.6050,0.9421;2.6551,0.9400;2.7052,0.9378;2.7553,0.9354;2.8054,0.9330;2.8555,0.9304;2.9056,0.9278;2.9557,0.9250;3.0058,0.9222;3.0559,0.9193;3.1060,0.9162;3.1561,0.9132;3.2062,0.9100;3.2563,0.9068;3.3064,0.9035;3.3565,0.9002;3.4066,0.8969;3.4567,0.8935;3.5068,0.8900;3.5569,0.8866;3.6070,0.8831;3.6571,0.8796;3.7072,0.8761;3.7573,0.8725;3.8074,0.8690;3.8575,0.8655;3.9076,0.8620;3.9577,0.8585;4.0078,0.8550;4.0578,0.8516;4.1079,0.8482;4.1580,0.8448;4.2081,0.8415;4.2582,0.8382;4.3083,0.8350;4.3584,0.8318;4.4085,0.8287;4.4586,0.8257;4.5087,0.8227;4.5588,0.8199;4.6089,0.8171;4.6590,0.8144;4.7091,0.8118;4.7592,0.8093;4.8093,0.8070;4.8594,0.8047;4.9095,0.8026;4.9596,0.8006;5.0097,0.7987;5.0598,0.7970;5.1099,0.7954;5.1600,0.7939;5.2101,0.7925;5.2602,0.7913;5.3103,0.7901;5.3604,0.7891;5.4105,0.7882;5.4606,0.7874;5.5107,0.7867;5.5608,0.7861;5.6109,0.7856;5.6609,0.7851;5.7110,0.7848;5.7611,0.7845;5.8112,0.7843;5.8613,0.7842;5.9114,0.7842;5.9615,0.7842;6.0116,0.7843;6.0617,0.7845;6.1118,0.7847;6.1619,0.7850;6.2120,0.7853;6.2621,0.7856;6.3122,0.7861;6.3623,0.7865;6.4124,0.7870;6.4625,0.7875;6.5126,0.7880;6.5627,0.7886;6.6128,0.7892;6.6629,0.7898;6.7130,0.7904;6.7631,0.7911;6.8132,0.7917;6.8633,0.7924;6.9134,0.7930;6.9635,0.7936;7.0136,0.7943;7.0637,0.7949;7.1138,0.7955;7.1639,0.7961;7.2140,0.7967;7.2641,0.7972;7.3141,0.7978;7.3642,0.7982;7.4143,0.7987;7.4644,0.7991;7.5145,0.7995;7.5646,0.7998;7.6147,0.8001;7.6648,0.8003;7.7149,0.8005;7.7650,0.8006;7.8151,0.8006;7.8652,0.8006;7.9153,0.8006;7.9654,0.8004;8.0155,0.8002;8.0656,0.8000;8.1157,0.7996;8.1658,0.7992;8.2159,0.7988;8.2660,0.7982;8.3161,0.7976;8.3662,0.7969;8.4163,0.7961;8.4664,0.7953;8.5165,0.7943;8.5666,0.7933;8.6167,0.7922;8.6668,0.7910;8.7169,0.7897;8.7670,0.7883;8.8171,0.7868;8.8672,0.7852;8.9172,0.7836;8.9673,0.7818;9.0174,0.7800;9.0675,0.7780;9.1176,0.7759;9.1677,0.7737;9.2178,0.7714;9.2679,0.7691;9.3180,0.7665;9.3681,0.7639;9.4182,0.7612;9.4683,0.7584;9.5184,0.7554;9.5685,0.7523;9.6186,0.7491;9.6687,0.7458;9.7188,0.7423;9.7689,0.7387;9.8190,0.7350;9.8691,0.7312;9.9192,0.7272;9.9693,0.7231;10.0194,0.7189;10.0695,0.7145;10.1196,0.7100;10.1697,0.7053;10.2198,0.7005;10.2699,0.6956;10.3200,0.6905;10.3701,0.6853;10.4202,0.6800;10.4703,0.6745;10.5203,0.6690;10.5704,0.6634;10.6205,0.6578;10.6706,0.6521;10.7207,0.6463;10.7708,0.6405;10.8209,0.6346;10.8710,0.6288;10.9211,0.6229;10.9712,0.6170;11.0213,0.6112;11.0714,0.6053;11.1215,0.5995;11.1716,0.5938;11.2217,0.5881;11.2718,0.5825;11.3219,0.5769;11.3720,0.5715;11.4221,0.5661;11.4722,0.5608;11.5223,0.5557;11.5724,0.5507;11.6225,0.5458;11.6726,0.5411;11.7227,0.5366;11.7728,0.5322;11.8229,0.5280;11.8730,0.5240;11.9231,0.5202;11.9732,0.5166;12.0233,0.5133;12.0734,0.5102;12.1235,0.5073;12.1735,0.5047;12.2236,0.5023;12.2737,0.5003;12.3238,0.4985;12.3739,0.4970;12.4240,0.4958;12.4741,0.4950;12.5242,0.4945;12.5743,0.4943;12.6244,0.4945;12.6745,0.4951;12.7246,0.4960;12.7747,0.4973;12.8248,0.4990;12.8749,0.5011;12.9250,0.5036;12.9751,0.5065;13.0252,0.5098;13.0753,0.5134;13.1254,0.5174;13.1755,0.5217;13.2256,0.5263;13.2757,0.5312;13.3258,0.5364;13.3759,0.5418;13.4260,0.5475;13.4761,0.5534;13.5262,0.5595;13.5763,0.5659;13.6264,0.5724;13.6765,0.5791;13.7266,0.5859;13.7766,0.5929;13.8267,0.6000;13.8768,0.6072;13.9269,0.6145;13.9770,0.6219;14.0271,0.6293;14.0772,0.6368;14.1273,0.6443;14.1774,0.6518;14.2275,0.6593;14.2776,0.6668;14.3277,0.6743;14.3778,0.6817;14.4279,0.6890;14.4780,0.6963;14.5281,0.7034;14.5782,0.7105;14.6283,0.7174;14.6784,0.7242;14.7285,0.7308;14.7786,0.7372;14.8287,0.7435;14.8788,0.7495;14.9289,0.7554;14.9790,0.7609;15.0291,0.7663;15.0792,0.7713;15.1293,0.7761;15.1794,0.7806;15.2295,0.7847;15.2796,0.7885;15.3297,0.7920;15.3797,0.7951;15.4298,0.7979;15.4799,0.8002;15.5300,0.8021;15.5801,0.8037;15.6302,0.8049;15.6803,0.8057;15.7304,0.8061;15.7805,0.8062;15.8306,0.8060;15.8807,0.8055;15.9308,0.8047;15.9809,0.8036;16.0310,0.8023;16.0811,0.8007;16.1312,0.7989;16.1813,0.7968;16.2314,0.7946;16.2815,0.7921;16.3316,0.7895;16.3817,0.7867;16.4318,0.7838;16.4819,0.7808;16.5320,0.7776;16.5821,0.7743;16.6322,0.7710;16.6823,0.7675;16.7324,0.7640;16.7825,0.7605;16.8326,0.7569;16.8827,0.7533;16.9328,0.7498;16.9828,0.7462;17.0329,0.7426;17.0830,0.7391;17.1331,0.7357;17.1832,0.7323;17.2333,0.7290;17.2834,0.7258;17.3335,0.7227;17.3836,0.7198;17.4337,0.7170;17.4838,0.7143;17.5339,0.7118;17.5840,0.7095;17.6341,0.7075;17.6842,0.7056;17.7343,0.7039;17.7844,0.7025;17.8345,0.7014;17.8846,0.7005;17.9347,0.7000;17.9848,0.6997;18.0349,0.6997;18.0850,0.7001;18.1351,0.7008;18.1852,0.7019;18.2353,0.7032;18.2854,0.7049;18.3355,0.7068;18.3856,0.7091;18.4357,0.7116;18.4858,0.7143;18.5359,0.7173;18.5860,0.7205;18.6360,0.7240;18.6861,0.7276;18.7362,0.7315;18.7863,0.7355;18.8364,0.7397;18.8865,0.7440;18.9366,0.7485;18.9867,0.7531;19.0368,0.7579;19.0869,0.7627;19.1370,0.7676;19.1871,0.7727;19.2372,0.7778;19.2873,0.7829;19.3374,0.7881;19.3875,0.7933;19.4376,0.7985;19.4877,0.8038;19.5378,0.8090;19.5879,0.8143;19.6380,0.8194;19.6881,0.8246;19.7382,0.8297;19.7883,0.8347;19.8384,0.8397;19.8885,0.8445;19.9386,0.8493;19.9887,0.8539;20.0388,0.8584;20.0889,0.8628;20.1390,0.8670;20.1891,0.8711;20.2391,0.8749;20.2892,0.8786;20.3393,0.8821;20.3894,0.8854;20.4395,0.8884;20.4896,0.8912;20.5397,0.8937;20.5898,0.8960;20.6399,0.8980;20.6900,0.8997;20.7401,0.9011;20.7902,0.9022;20.8403,0.9030;20.8904,0.9036;20.9405,0.9038;20.9906,0.9038;21.0407,0.9035;21.0908,0.9029;21.1409,0.9021;21.1910,0.9010;21.2411,0.8997;21.2912,0.8981;21.3413,0.8963;21.3914,0.8943;21.4415,0.8920;21.4916,0.8895;21.5417,0.8868;21.5918,0.8839;21.6419,0.8808;21.6920,0.8775;21.7421,0.8741;21.7922,0.8704;21.8422,0.8665;21.8923,0.8625;21.9424,0.8583;21.9925,0.8540;22.0426,0.8495;22.0927,0.8449;22.1428,0.8401;22.1929,0.8351;22.2430,0.8301;22.2931,0.8249;22.3432,0.8196;22.3933,0.8142;22.4434,0.8087;22.4935,0.8030;22.5436,0.7973;22.5937,0.7915;22.6438,0.7856;22.6939,0.7796;22.7440,0.7736;22.7941,0.7675;22.8442,0.7613;22.8943,0.7551;22.9444,0.7488;22.9945,0.7424;23.0446,0.7361;23.0947,0.7297;23.1448,0.7232;23.1949,0.7168;23.2450,0.7103;23.2951,0.7039;23.3452,0.6974;23.3953,0.6909;23.4453,0.6845;23.4954,0.6780;23.5455,0.6716;23.5956,0.6652;23.6457,0.6588;23.6958,0.6525;23.7459,0.6462;23.7960,0.6399;23.8461,0.6337;23.8962,0.6276;23.9463,0.6215;23.9964,0.6155;24.0465,0.6096;24.0966,0.6038;24.1467,0.5981;24.1968,0.5924;24.2469,0.5869;24.2970,0.5814;24.3471,0.5761;24.3972,0.5709;24.4473,0.5658;24.4974,0.5609;24.5475,0.5561;24.5976,0.5514;24.6477,0.5469;24.6978,0.5425;24.7479,0.5383;24.7980,0.5342;24.8481,0.5303;24.8982,0.5266;24.9483,0.5231;24.9984,0.5198;25.0485,0.5167;25.0985,0.5137;25.1486,0.5110;25.1987,0.5085;25.2488,0.5062;25.2989,0.5041;25.3490,0.5022;25.3991,0.5006;25.4492,0.4992;25.4993,0.4981;25.5494,0.4972;25.5995,0.4966;25.6496,0.4963;25.6997,0.4962;25.7498,0.4964;25.7999,0.4968;25.8500,0.4976];
plot(c3(:,1),c3(:,2),'--w','LineWidth',1.1)
set(gca, 'YDir','reverse')
hold on
c4=[0.0000,1.9000;0.0501,1.9039;0.1002,1.9078;0.1503,1.9118;0.2004,1.9157;0.2505,1.9195;0.3006,1.9234;0.3507,1.9272;0.4008,1.9310;0.4509,1.9348;0.5010,1.9385;0.5511,1.9421;0.6012,1.9457;0.6513,1.9493;0.7014,1.9528;0.7515,1.9562;0.8016,1.9595;0.8516,1.9628;0.9017,1.9660;0.9518,1.9691;1.0019,1.9721;1.0520,1.9750;1.1021,1.9778;1.1522,1.9805;1.2023,1.9831;1.2524,1.9855;1.3025,1.9879;1.3526,1.9901;1.4027,1.9922;1.4528,1.9942;1.5029,1.9960;1.5530,1.9976;1.6031,1.9992;1.6532,2.0005;1.7033,2.0017;1.7534,2.0028;1.8035,2.0036;1.8536,2.0043;1.9037,2.0048;1.9538,2.0052;2.0039,2.0053;2.0540,2.0053;2.1041,2.0050;2.1542,2.0046;2.2043,2.0039;2.2544,2.0030;2.3045,2.0019;2.3546,2.0006;2.4047,1.9991;2.4547,1.9973;2.5048,1.9953;2.5549,1.9931;2.6050,1.9907;2.6551,1.9881;2.7052,1.9853;2.7553,1.9824;2.8054,1.9793;2.8555,1.9760;2.9056,1.9725;2.9557,1.9690;3.0058,1.9653;3.0559,1.9614;3.1060,1.9575;3.1561,1.9534;3.2062,1.9492;3.2563,1.9449;3.3064,1.9406;3.3565,1.9361;3.4066,1.9316;3.4567,1.9270;3.5068,1.9224;3.5569,1.9177;3.6070,1.9130;3.6571,1.9083;3.7072,1.9035;3.7573,1.8987;3.8074,1.8940;3.8575,1.8892;3.9076,1.8844;3.9577,1.8796;4.0078,1.8749;4.0578,1.8702;4.1079,1.8656;4.1580,1.8610;4.2081,1.8564;4.2582,1.8519;4.3083,1.8475;4.3584,1.8432;4.4085,1.8390;4.4586,1.8349;4.5087,1.8308;4.5588,1.8269;4.6089,1.8231;4.6590,1.8195;4.7091,1.8160;4.7592,1.8126;4.8093,1.8094;4.8594,1.8064;4.9095,1.8035;4.9596,1.8008;5.0097,1.7983;5.0598,1.7960;5.1099,1.7938;5.1600,1.7919;5.2101,1.7901;5.2602,1.7885;5.3103,1.7870;5.3604,1.7857;5.4105,1.7845;5.4606,1.7835;5.5107,1.7826;5.5608,1.7819;5.6109,1.7813;5.6609,1.7808;5.7110,1.7804;5.7611,1.7802;5.8112,1.7800;5.8613,1.7800;5.9114,1.7800;5.9615,1.7801;6.0116,1.7804;6.0617,1.7806;6.1118,1.7810;6.1619,1.7815;6.2120,1.7820;6.2621,1.7825;6.3122,1.7831;6.3623,1.7838;6.4124,1.7845;6.4625,1.7852;6.5126,1.7860;6.5627,1.7868;6.6128,1.7876;6.6629,1.7885;6.7130,1.7893;6.7631,1.7902;6.8132,1.7910;6.8633,1.7918;6.9134,1.7927;6.9635,1.7935;7.0136,1.7943;7.0637,1.7950;7.1138,1.7958;7.1639,1.7964;7.2140,1.7971;7.2641,1.7977;7.3141,1.7982;7.3642,1.7987;7.4143,1.7991;7.4644,1.7995;7.5145,1.7997;7.5646,1.7999;7.6147,1.8000;7.6648,1.8000;7.7149,1.7999;7.7650,1.7997;7.8151,1.7994;7.8652,1.7990;7.9153,1.7984;7.9654,1.7977;8.0155,1.7968;8.0656,1.7958;8.1157,1.7947;8.1658,1.7933;8.2159,1.7918;8.2660,1.7901;8.3161,1.7882;8.3662,1.7861;8.4163,1.7839;8.4664,1.7814;8.5165,1.7786;8.5666,1.7757;8.6167,1.7725;8.6668,1.7691;8.7169,1.7654;8.7670,1.7615;8.8171,1.7573;8.8672,1.7528;8.9172,1.7480;8.9673,1.7430;9.0174,1.7377;9.0675,1.7320;9.1176,1.7261;9.1677,1.7198;9.2178,1.7132;9.2679,1.7063;9.3180,1.6990;9.3681,1.6914;9.4182,1.6834;9.4683,1.6751;9.5184,1.6664;9.5685,1.6573;9.6186,1.6479;9.6687,1.6380;9.7188,1.6278;9.7689,1.6171;9.8190,1.6060;9.8691,1.5945;9.9192,1.5826;9.9693,1.5702;10.0194,1.5574;10.0695,1.5441;10.1196,1.5304;10.1697,1.5162;10.2198,1.5016;10.2699,1.4864;10.3200,1.4708;10.3701,1.4548;10.4202,1.4384;10.4703,1.4217;10.5203,1.4046;10.5704,1.3873;10.6205,1.3697;10.6706,1.3520;10.7207,1.3340;10.7708,1.3160;10.8209,1.2978;10.8710,1.2796;10.9211,1.2613;10.9712,1.2431;11.0213,1.2249;11.0714,1.2067;11.1215,1.1887;11.1716,1.1708;11.2217,1.1532;11.2718,1.1357;11.3219,1.1185;11.3720,1.1016;11.4221,1.0850;11.4722,1.0687;11.5223,1.0529;11.5724,1.0375;11.6225,1.0226;11.6726,1.0081;11.7227,0.9942;11.7728,0.9809;11.8229,0.9682;11.8730,0.9561;11.9231,0.9447;11.9732,0.9341;12.0233,0.9241;12.0734,0.9150;12.1235,0.9067;12.1735,0.8992;12.2236,0.8926;12.2737,0.8870;12.3238,0.8823;12.3739,0.8786;12.4240,0.8759;12.4741,0.8743;12.5242,0.8738;12.5743,0.8745;12.6244,0.8763;12.6745,0.8793;12.7246,0.8836;12.7747,0.8892;12.8248,0.8960;12.8749,0.9043;12.9250,0.9138;12.9751,0.9247;13.0252,0.9368;13.0753,0.9501;13.1254,0.9646;13.1755,0.9802;13.2256,0.9968;13.2757,1.0145;13.3258,1.0332;13.3759,1.0527;13.4260,1.0732;13.4761,1.0945;13.5262,1.1166;13.5763,1.1394;13.6264,1.1630;13.6765,1.1872;13.7266,1.2119;13.7766,1.2373;13.8267,1.2632;13.8768,1.2895;13.9269,1.3162;13.9770,1.3434;14.0271,1.3708;14.0772,1.3985;14.1273,1.4265;14.1774,1.4547;14.2275,1.4830;14.2776,1.5113;14.3277,1.5398;14.3778,1.5682;14.4279,1.5967;14.4780,1.6250;14.5281,1.6532;14.5782,1.6812;14.6283,1.7089;14.6784,1.7364;14.7285,1.7636;14.7786,1.7904;14.8287,1.8168;14.8788,1.8428;14.9289,1.8682;14.9790,1.8931;15.0291,1.9174;15.0792,1.9411;15.1293,1.9640;15.1794,1.9863;15.2295,2.0077;15.2796,2.0283;15.3297,2.0481;15.3797,2.0669;15.4298,2.0847;15.4799,2.1016;15.5300,2.1174;15.5801,2.1322;15.6302,2.1459;15.6803,2.1587;15.7304,2.1705;15.7805,2.1813;15.8306,2.1912;15.8807,2.2002;15.9308,2.2083;15.9809,2.2155;16.0310,2.2219;16.0811,2.2275;16.1312,2.2322;16.1813,2.2361;16.2314,2.2393;16.2815,2.2417;16.3316,2.2434;16.3817,2.2444;16.4318,2.2447;16.4819,2.2443;16.5320,2.2433;16.5821,2.2416;16.6322,2.2393;16.6823,2.2364;16.7324,2.2330;16.7825,2.2290;16.8326,2.2245;16.8827,2.2195;16.9328,2.2139;16.9828,2.2079;17.0329,2.2015;17.0830,2.1946;17.1331,2.1873;17.1832,2.1797;17.2333,2.1716;17.2834,2.1632;17.3335,2.1545;17.3836,2.1455;17.4337,2.1362;17.4838,2.1266;17.5339,2.1167;17.5840,2.1067;17.6341,2.0964;17.6842,2.0859;17.7343,2.0753;17.7844,2.0645;17.8345,2.0536;17.8846,2.0426;17.9347,2.0315;17.9848,2.0203;18.0349,2.0090;18.0850,1.9978;18.1351,1.9865;18.1852,1.9752;18.2353,1.9639;18.2854,1.9527;18.3355,1.9414;18.3856,1.9301;18.4357,1.9189;18.4858,1.9077;18.5359,1.8964;18.5860,1.8853;18.6360,1.8741;18.6861,1.8630;18.7362,1.8520;18.7863,1.8410;18.8364,1.8300;18.8865,1.8191;18.9366,1.8083;18.9867,1.7975;19.0368,1.7868;19.0869,1.7761;19.1370,1.7656;19.1871,1.7551;19.2372,1.7447;19.2873,1.7344;19.3374,1.7242;19.3875,1.7141;19.4376,1.7041;19.4877,1.6942;19.5378,1.6844;19.5879,1.6748;19.6380,1.6652;19.6881,1.6558;19.7382,1.6465;19.7883,1.6374;19.8384,1.6284;19.8885,1.6195;19.9386,1.6108;19.9887,1.6023;20.0388,1.5939;20.0889,1.5856;20.1390,1.5776;20.1891,1.5697;20.2391,1.5620;20.2892,1.5544;20.3393,1.5471;20.3894,1.5399;20.4395,1.5329;20.4896,1.5262;20.5397,1.5196;20.5898,1.5132;20.6399,1.5071;20.6900,1.5011;20.7401,1.4954;20.7902,1.4899;20.8403,1.4847;20.8904,1.4796;20.9405,1.4747;20.9906,1.4701;21.0407,1.4656;21.0908,1.4613;21.1409,1.4572;21.1910,1.4533;21.2411,1.4496;21.2912,1.4461;21.3413,1.4427;21.3914,1.4395;21.4415,1.4365;21.4916,1.4336;21.5417,1.4308;21.5918,1.4283;21.6419,1.4258;21.6920,1.4235;21.7421,1.4214;21.7922,1.4194;21.8422,1.4175;21.8923,1.4157;21.9424,1.4141;21.9925,1.4125;22.0426,1.4111;22.0927,1.4098;22.1428,1.4086;22.1929,1.4075;22.2430,1.4065;22.2931,1.4056;22.3432,1.4048;22.3933,1.4040;22.4434,1.4034;22.4935,1.4028;22.5436,1.4023;22.5937,1.4018;22.6438,1.4014;22.6939,1.4011;22.7440,1.4008;22.7941,1.4005;22.8442,1.4004;22.8943,1.4002;22.9444,1.4001;22.9945,1.4000;23.0446,1.4000;23.0947,1.3999;23.1448,1.3999;23.1949,1.3999;23.2450,1.4000;23.2951,1.4000;23.3452,1.4000;23.3953,1.4000;23.4453,1.4000;23.4954,1.4001;23.5455,1.4001;23.5956,1.4000;23.6457,1.4000;23.6958,1.3999;23.7459,1.3998;23.7960,1.3997;23.8461,1.3995;23.8962,1.3993;23.9463,1.3990;23.9964,1.3987;24.0465,1.3983;24.0966,1.3978;24.1467,1.3973;24.1968,1.3967;24.2469,1.3961;24.2970,1.3954;24.3471,1.3946;24.3972,1.3937;24.4473,1.3927;24.4974,1.3916;24.5475,1.3904;24.5976,1.3891;24.6477,1.3877;24.6978,1.3862;24.7479,1.3846;24.7980,1.3829;24.8481,1.3810;24.8982,1.3790;24.9483,1.3769;24.9984,1.3746;25.0485,1.3722;25.0985,1.3697;25.1486,1.3670;25.1987,1.3641;25.2488,1.3611;25.2989,1.3579;25.3490,1.3546;25.3991,1.3511;25.4492,1.3474;25.4993,1.3435;25.5494,1.3395;25.5995,1.3352;25.6496,1.3308;25.6997,1.3262;25.7498,1.3214;25.7999,1.3163;25.8500,1.3111];
plot(c4(:,1),c4(:,2),'--w','LineWidth',1.1)
set(gca, 'YDir','reverse')
hold on
c5=[0.0000,3.0000;0.0501,3.0000;0.1002,3.0000;0.1503,3.0000;0.2004,3.0000;0.2505,3.0000;0.3006,3.0000;0.3507,3.0000;0.4008,3.0000;0.4509,3.0000;0.5010,3.0000;0.5511,3.0000;0.6012,3.0000;0.6513,3.0000;0.7014,3.0000;0.7515,3.0000;0.8016,3.0000;0.8516,3.0000;0.9017,3.0000;0.9518,3.0000;1.0019,3.0000;1.0520,3.0000;1.1021,3.0000;1.1522,3.0000;1.2023,3.0000;1.2524,3.0000;1.3025,3.0000;1.3526,3.0000;1.4027,3.0000;1.4528,3.0000;1.5029,3.0000;1.5530,3.0000;1.6031,3.0000;1.6532,3.0000;1.7033,3.0000;1.7534,3.0000;1.8035,3.0000;1.8536,3.0000;1.9037,3.0000;1.9538,3.0000;2.0039,3.0000;2.0540,3.0000;2.1041,3.0000;2.1542,3.0000;2.2043,3.0000;2.2544,3.0000;2.3045,3.0000;2.3546,3.0000;2.4047,3.0000;2.4547,3.0000;2.5048,3.0000;2.5549,3.0000;2.6050,3.0000;2.6551,3.0000;2.7052,3.0000;2.7553,3.0000;2.8054,3.0000;2.8555,3.0000;2.9056,3.0000;2.9557,3.0000;3.0058,3.0000;3.0559,3.0000;3.1060,3.0000;3.1561,3.0000;3.2062,3.0000;3.2563,3.0000;3.3064,3.0000;3.3565,3.0000;3.4066,3.0000;3.4567,3.0000;3.5068,3.0000;3.5569,3.0000;3.6070,3.0000;3.6571,3.0000;3.7072,3.0000;3.7573,3.0000;3.8074,3.0000;3.8575,3.0000;3.9076,3.0000;3.9577,3.0000;4.0078,3.0000;4.0578,3.0000;4.1079,3.0000;4.1580,3.0000;4.2081,3.0000;4.2582,3.0000;4.3083,3.0000;4.3584,3.0000;4.4085,3.0000;4.4586,3.0000;4.5087,3.0000;4.5588,3.0000;4.6089,3.0000;4.6590,3.0000;4.7091,3.0000;4.7592,3.0000;4.8093,3.0000;4.8594,3.0000;4.9095,3.0000;4.9596,3.0000;5.0097,3.0000;5.0598,3.0000;5.1099,3.0000;5.1600,3.0000;5.2101,3.0000;5.2602,3.0000;5.3103,3.0000;5.3604,3.0000;5.4105,3.0000;5.4606,3.0000;5.5107,3.0000;5.5608,3.0000;5.6109,3.0000;5.6609,3.0000;5.7110,3.0000;5.7611,3.0000;5.8112,3.0000;5.8613,3.0000;5.9114,3.0000;5.9615,3.0000;6.0116,3.0000;6.0617,3.0000;6.1118,3.0000;6.1619,3.0000;6.2120,3.0000;6.2621,3.0000;6.3122,3.0000;6.3623,3.0000;6.4124,3.0000;6.4625,3.0000;6.5126,3.0000;6.5627,3.0000;6.6128,3.0000;6.6629,3.0000;6.7130,3.0000;6.7631,3.0000;6.8132,3.0000;6.8633,3.0000;6.9134,3.0000;6.9635,3.0000;7.0136,3.0000;7.0637,3.0000;7.1138,3.0000;7.1639,3.0000;7.2140,3.0000;7.2641,3.0000;7.3141,3.0000;7.3642,3.0000;7.4143,3.0000;7.4644,3.0000;7.5145,3.0000;7.5646,3.0000;7.6147,3.0000;7.6648,3.0000;7.7149,3.0000;7.7650,3.0000;7.8151,3.0000;7.8652,3.0000;7.9153,3.0000;7.9654,3.0000;8.0155,3.0000;8.0656,3.0000;8.1157,3.0000;8.1658,3.0000;8.2159,3.0000;8.2660,3.0000;8.3161,3.0000;8.3662,3.0000;8.4163,3.0000;8.4664,3.0000;8.5165,3.0000;8.5666,3.0000;8.6167,3.0000;8.6668,3.0000;8.7169,3.0000;8.7670,3.0000;8.8171,3.0000;8.8672,3.0000;8.9172,3.0000;8.9673,3.0000;9.0174,3.0000;9.0675,3.0000;9.1176,3.0000;9.1677,3.0000;9.2178,3.0000;9.2679,3.0000;9.3180,3.0000;9.3681,3.0000;9.4182,3.0000;9.4683,3.0000;9.5184,3.0000;9.5685,3.0000;9.6186,3.0000;9.6687,3.0000;9.7188,3.0000;9.7689,3.0000;9.8190,3.0000;9.8691,3.0000;9.9192,3.0000;9.9693,3.0000;10.0194,3.0000;10.0695,3.0000;10.1196,3.0000;10.1697,3.0000;10.2198,3.0000;10.2699,3.0000;10.3200,3.0000;10.3701,3.0000;10.4202,3.0000;10.4703,3.0000;10.5203,3.0000;10.5704,3.0000;10.6205,3.0000;10.6706,3.0000;10.7207,3.0000;10.7708,3.0000;10.8209,3.0000;10.8710,3.0000;10.9211,3.0000;10.9712,3.0000;11.0213,3.0000;11.0714,3.0000;11.1215,3.0000;11.1716,3.0000;11.2217,3.0000;11.2718,3.0000;11.3219,3.0000;11.3720,3.0000;11.4221,3.0000;11.4722,3.0000;11.5223,3.0000;11.5724,3.0000;11.6225,3.0000;11.6726,3.0000;11.7227,3.0000;11.7728,3.0000;11.8229,3.0000;11.8730,3.0000;11.9231,3.0000;11.9732,3.0000;12.0233,3.0000;12.0734,3.0000;12.1235,3.0000;12.1735,3.0000;12.2236,3.0000;12.2737,3.0000;12.3238,3.0000;12.3739,3.0000;12.4240,3.0000;12.4741,3.0000;12.5242,3.0000;12.5743,3.0000;12.6244,3.0000;12.6745,3.0000;12.7246,3.0000;12.7747,3.0000;12.8248,3.0000;12.8749,3.0000;12.9250,3.0000;12.9751,3.0000;13.0252,3.0000;13.0753,3.0000;13.1254,3.0000;13.1755,3.0000;13.2256,3.0000;13.2757,3.0000;13.3258,3.0000;13.3759,3.0000;13.4260,3.0000;13.4761,3.0000;13.5262,3.0000;13.5763,3.0000;13.6264,3.0000;13.6765,3.0000;13.7266,3.0000;13.7766,3.0000;13.8267,3.0000;13.8768,3.0000;13.9269,3.0000;13.9770,3.0000;14.0271,3.0000;14.0772,3.0000;14.1273,3.0000;14.1774,3.0000;14.2275,3.0000;14.2776,3.0000;14.3277,3.0000;14.3778,3.0000;14.4279,3.0000;14.4780,3.0000;14.5281,3.0000;14.5782,3.0000;14.6283,3.0000;14.6784,3.0000;14.7285,3.0000;14.7786,3.0000;14.8287,3.0000;14.8788,3.0000;14.9289,3.0000;14.9790,3.0000;15.0291,3.0000;15.0792,3.0000;15.1293,3.0000;15.1794,3.0000;15.2295,3.0000;15.2796,3.0000;15.3297,3.0000;15.3797,3.0000;15.4298,3.0000;15.4799,3.0000;15.5300,3.0000;15.5801,3.0000;15.6302,3.0000;15.6803,3.0000;15.7304,3.0000;15.7805,3.0000;15.8306,3.0000;15.8807,3.0000;15.9308,3.0000;15.9809,3.0000;16.0310,3.0000;16.0811,3.0000;16.1312,3.0000;16.1813,3.0000;16.2314,3.0000;16.2815,3.0000;16.3316,3.0000;16.3817,3.0000;16.4318,3.0000;16.4819,3.0000;16.5320,3.0000;16.5821,3.0000;16.6322,3.0000;16.6823,3.0000;16.7324,3.0000;16.7825,3.0000;16.8326,3.0000;16.8827,3.0000;16.9328,3.0000;16.9828,3.0000;17.0329,3.0000;17.0830,3.0000;17.1331,3.0000;17.1832,3.0000;17.2333,3.0000;17.2834,3.0000;17.3335,3.0000;17.3836,3.0000;17.4337,3.0000;17.4838,3.0000;17.5339,3.0000;17.5840,3.0000;17.6341,3.0000;17.6842,3.0000;17.7343,3.0000;17.7844,3.0000;17.8345,3.0000;17.8846,3.0000;17.9347,3.0000;17.9848,3.0000;18.0349,3.0000;18.0850,3.0000;18.1351,3.0000;18.1852,3.0000;18.2353,3.0000;18.2854,3.0000;18.3355,3.0000;18.3856,3.0000;18.4357,3.0000;18.4858,3.0000;18.5359,3.0000;18.5860,3.0000;18.6360,3.0000;18.6861,3.0000;18.7362,3.0000;18.7863,3.0000;18.8364,3.0000;18.8865,3.0000;18.9366,3.0000;18.9867,3.0000;19.0368,3.0000;19.0869,3.0000;19.1370,3.0000;19.1871,3.0000;19.2372,3.0000;19.2873,3.0000;19.3374,3.0000;19.3875,3.0000;19.4376,3.0000;19.4877,3.0000;19.5378,3.0000;19.5879,3.0000;19.6380,3.0000;19.6881,3.0000;19.7382,3.0000;19.7883,3.0000;19.8384,3.0000;19.8885,3.0000;19.9386,3.0000;19.9887,3.0000;20.0388,3.0000;20.0889,3.0000;20.1390,3.0000;20.1891,3.0000;20.2391,3.0000;20.2892,3.0000;20.3393,3.0000;20.3894,3.0000;20.4395,3.0000;20.4896,3.0000;20.5397,3.0000;20.5898,3.0000;20.6399,3.0000;20.6900,3.0000;20.7401,3.0000;20.7902,3.0000;20.8403,3.0000;20.8904,3.0000;20.9405,3.0000;20.9906,3.0000;21.0407,3.0000;21.0908,3.0000;21.1409,3.0000;21.1910,3.0000;21.2411,3.0000;21.2912,3.0000;21.3413,3.0000;21.3914,3.0000;21.4415,3.0000;21.4916,3.0000;21.5417,3.0000;21.5918,3.0000;21.6419,3.0000;21.6920,3.0000;21.7421,3.0000;21.7922,3.0000;21.8422,3.0000;21.8923,3.0000;21.9424,3.0000;21.9925,3.0000;22.0426,3.0000;22.0927,3.0000;22.1428,3.0000;22.1929,3.0000;22.2430,3.0000;22.2931,3.0000;22.3432,3.0000;22.3933,3.0000;22.4434,3.0000;22.4935,3.0000;22.5436,3.0000;22.5937,3.0000;22.6438,3.0000;22.6939,3.0000;22.7440,3.0000;22.7941,3.0000;22.8442,3.0000;22.8943,3.0000;22.9444,3.0000;22.9945,3.0000;23.0446,3.0000;23.0947,3.0000;23.1448,3.0000;23.1949,3.0000;23.2450,3.0000;23.2951,3.0000;23.3452,3.0000;23.3953,3.0000;23.4453,3.0000;23.4954,3.0000;23.5455,3.0000;23.5956,3.0000;23.6457,3.0000;23.6958,3.0000;23.7459,3.0000;23.7960,3.0000;23.8461,3.0000;23.8962,3.0000;23.9463,3.0000;23.9964,3.0000;24.0465,3.0000;24.0966,3.0000;24.1467,3.0000;24.1968,3.0000;24.2469,3.0000;24.2970,3.0000;24.3471,3.0000;24.3972,3.0000;24.4473,3.0000;24.4974,3.0000;24.5475,3.0000;24.5976,3.0000;24.6477,3.0000;24.6978,3.0000;24.7479,3.0000;24.7980,3.0000;24.8481,3.0000;24.8982,3.0000;24.9483,3.0000;24.9984,3.0000;25.0485,3.0000;25.0985,3.0000;25.1486,3.0000;25.1987,3.0000;25.2488,3.0000;25.2989,3.0000;25.3490,3.0000;25.3991,3.0000;25.4492,3.0000;25.4993,3.0000;25.5494,3.0000;25.5995,3.0000;25.6496,3.0000;25.6997,3.0000;25.7498,3.0000;25.7999,3.0000;25.8500,3.0000];
plot(c5(:,1),c5(:,2),'k')
set(gca, 'YDir','reverse')
%hold on
