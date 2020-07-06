//Maya ASCII 2019 scene
//Name: animation.ma
//Last modified: Sun, Jul 05, 2020 10:09:33 PM
//Codeset: 1252
requires maya "2019";
requires "stereoCamera" "10.0";
requires "mtoa" "3.1.2";
currentUnit -l centimeter -a degree -t film;
fileInfo "application" "maya";
fileInfo "product" "Maya 2019";
fileInfo "version" "2019";
fileInfo "cutIdentifier" "201812112215-434d8d9c04";
fileInfo "osv" "Microsoft Windows 10 Technical Preview  (Build 18362)\n";
fileInfo "license" "student";
createNode animCurveTL -n "CURVE1";
	rename -uid "8213C616-412D-A406-D0EB-BB87D70ADC5E";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 10 ".ktv[0:9]"  0 0 12 0 24 0 32 0 40 0 46 0 52 0 58 0 64 0
		 71 0;
	setAttr -s 10 ".kit[3:9]"  1 1 18 18 18 18 1;
	setAttr -s 10 ".kot[0:9]"  1 18 18 1 1 18 18 18 
		18 18;
	setAttr -s 10 ".kix[3:9]"  1 1 1 1 1 1 1;
	setAttr -s 10 ".kiy[3:9]"  0 0 0 0 0 0 0;
	setAttr -s 10 ".kox[0:9]"  1 1 1 1 1 1 1 1 1 1;
	setAttr -s 10 ".koy[0:9]"  0 0 0 0 0 0 0 0 0 0;
createNode animCurveTL -n "CURVE2";
	rename -uid "941EF5D7-4810-3EEF-0F77-E192E1D1D157";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 10 ".ktv[0:9]"  0 0 12 0 24 0 32 0 40 0 46 0 52 0 58 0 64 0
		 71 0;
	setAttr -s 10 ".kit[3:9]"  1 1 18 18 18 18 1;
	setAttr -s 10 ".kot[0:9]"  1 18 18 1 1 18 18 18 
		18 18;
	setAttr -s 10 ".kix[3:9]"  1 1 1 1 1 1 1;
	setAttr -s 10 ".kiy[3:9]"  0 0 0 0 0 0 0;
	setAttr -s 10 ".kox[0:9]"  1 1 1 1 1 1 1 1 1 1;
	setAttr -s 10 ".koy[0:9]"  0 0 0 0 0 0 0 0 0 0;
createNode animCurveTL -n "CURVE3";
	rename -uid "8B04965F-476E-2A2F-F2A5-E9AA1783D68D";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 10 ".ktv[0:9]"  0 0 12 0 24 0 32 0 40 0 46 0 52 0 58 0 64 0
		 71 0;
	setAttr -s 10 ".kit[3:9]"  1 1 18 18 18 18 1;
	setAttr -s 10 ".kot[0:9]"  1 18 18 1 1 18 18 18 
		18 18;
	setAttr -s 10 ".kix[3:9]"  1 1 1 1 1 1 1;
	setAttr -s 10 ".kiy[3:9]"  0 0 0 0 0 0 0;
	setAttr -s 10 ".kox[0:9]"  1 1 1 1 1 1 1 1 1 1;
	setAttr -s 10 ".koy[0:9]"  0 0 0 0 0 0 0 0 0 0;
createNode animCurveTU -n "CURVE4";
	rename -uid "138DB189-406B-E031-E225-70B5A6508459";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 10 ".ktv[0:9]"  0 1 12 1 24 1 32 1 40 1 46 1 52 1 58 1 64 1
		 71 1;
	setAttr -s 10 ".kit[3:9]"  1 1 18 18 18 18 1;
	setAttr -s 10 ".kot[0:9]"  1 18 18 1 1 18 18 18 
		18 18;
	setAttr -s 10 ".kix[3:9]"  1 1 1 1 1 1 1;
	setAttr -s 10 ".kiy[3:9]"  0 0 0 0 0 0 0;
	setAttr -s 10 ".kox[0:9]"  1 1 1 1 1 1 1 1 1 1;
	setAttr -s 10 ".koy[0:9]"  0 0 0 0 0 0 0 0 0 0;
createNode animCurveTU -n "CURVE5";
	rename -uid "91C6648D-4604-4F9F-3329-A084A9576DA9";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 10 ".ktv[0:9]"  0 1 12 1 24 1 32 1 40 1 46 1 52 1 58 1 64 1
		 71 1;
	setAttr -s 10 ".kit[3:9]"  1 1 18 18 18 18 1;
	setAttr -s 10 ".kot[0:9]"  1 18 18 1 1 18 18 18 
		18 18;
	setAttr -s 10 ".kix[3:9]"  1 1 1 1 1 1 1;
	setAttr -s 10 ".kiy[3:9]"  0 0 0 0 0 0 0;
	setAttr -s 10 ".kox[0:9]"  1 1 1 1 1 1 1 1 1 1;
	setAttr -s 10 ".koy[0:9]"  0 0 0 0 0 0 0 0 0 0;
createNode animCurveTU -n "CURVE6";
	rename -uid "492F6A2F-4E8A-1859-E3C6-42B6279ABBC4";
	setAttr ".tan" 5;
	setAttr ".wgt" no;
	setAttr -s 10 ".ktv[0:9]"  0 1 12 1 24 1 32 1 40 1 46 1 52 1 58 1 64 1
		 71 1;
	setAttr -s 10 ".kit[0:9]"  9 9 9 1 1 9 9 9 
		9 1;
	setAttr -s 10 ".kix[3:9]"  1 1 1 1 1 1 1;
	setAttr -s 10 ".kiy[3:9]"  0 0 0 0 0 0 0;
createNode animCurveTA -n "CURVE7";
	rename -uid "741B802C-4151-17F5-6DAC-1AAA4B0DDA69";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 10 ".ktv[0:9]"  0 0 12 -90 24 -90 32 0 40 0 46 0 52 0 58 0
		 64 0 71 0;
	setAttr -s 10 ".kit[3:9]"  1 1 18 18 18 18 1;
	setAttr -s 10 ".kot[0:9]"  1 18 18 1 1 18 18 18 
		18 18;
	setAttr -s 10 ".kix[3:9]"  1 1 1 1 1 1 1;
	setAttr -s 10 ".kiy[3:9]"  0 0 0 0 0 0 0;
	setAttr -s 10 ".kox[0:9]"  1 1 1 1 1 1 1 1 1 1;
	setAttr -s 10 ".koy[0:9]"  0 0 0 0 0 0 0 0 0 0;
createNode animCurveTA -n "CURVE8";
	rename -uid "2E1030C2-4FE4-ED22-8631-8A89A225667B";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 10 ".ktv[0:9]"  0 0 12 0 24 0 32 0 40 0 46 0 52 0 58 0 64 0
		 71 0;
	setAttr -s 10 ".kit[3:9]"  1 1 18 18 18 18 1;
	setAttr -s 10 ".kot[0:9]"  1 18 18 1 1 18 18 18 
		18 18;
	setAttr -s 10 ".kix[3:9]"  1 1 1 1 1 1 1;
	setAttr -s 10 ".kiy[3:9]"  0 0 0 0 0 0 0;
	setAttr -s 10 ".kox[0:9]"  1 1 1 1 1 1 1 1 1 1;
	setAttr -s 10 ".koy[0:9]"  0 0 0 0 0 0 0 0 0 0;
createNode animCurveTA -n "CURVE9";
	rename -uid "C52DE34C-4CFA-5C92-B5E8-DA8425F8A44E";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 10 ".ktv[0:9]"  0 0 12 0 24 0 32 0 40 0 46 -25 52 -25 58 -25
		 64 -25 71 0;
	setAttr -s 10 ".kit[3:9]"  1 1 18 18 18 18 1;
	setAttr -s 10 ".kot[0:9]"  1 18 18 1 1 18 18 18 
		18 18;
	setAttr -s 10 ".kix[3:9]"  1 1 1 1 1 1 1;
	setAttr -s 10 ".kiy[3:9]"  0 0 0 0 0 0 0;
	setAttr -s 10 ".kox[0:9]"  1 1 1 1 1 1 1 1 1 1;
	setAttr -s 10 ".koy[0:9]"  0 0 0 0 0 0 0 0 0 0;
createNode animCurveTU -n "CURVE10";
	rename -uid "3E1FB7B5-4D7D-1632-A3E2-67BBE3E5CDA7";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 10 ".ktv[0:9]"  0 1 12 1 24 1 32 1 40 1 46 1 52 1 58 1 64 1
		 71 1;
	setAttr -s 10 ".kit[3:9]"  1 1 18 18 18 18 1;
	setAttr -s 10 ".kot[0:9]"  1 18 18 1 1 18 18 18 
		18 18;
	setAttr -s 10 ".kix[3:9]"  1 1 1 1 1 1 1;
	setAttr -s 10 ".kiy[3:9]"  0 0 0 0 0 0 0;
	setAttr -s 10 ".kox[0:9]"  1 1 1 1 1 1 1 1 1 1;
	setAttr -s 10 ".koy[0:9]"  0 0 0 0 0 0 0 0 0 0;
createNode animCurveTL -n "CURVE12";
	rename -uid "EA4B1691-4CFC-4B34-AD53-04A5D58B1A36";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 10 ".ktv[0:9]"  0 0 12 0 24 0 32 0 40 0 46 0 52 0 58 0 64 0
		 71 0;
	setAttr -s 10 ".kit[3:9]"  1 1 18 18 18 18 1;
	setAttr -s 10 ".kot[0:9]"  1 18 18 1 1 18 18 18 
		18 18;
	setAttr -s 10 ".kix[3:9]"  1 1 1 1 1 1 1;
	setAttr -s 10 ".kiy[3:9]"  0 0 0 0 0 0 0;
	setAttr -s 10 ".kox[0:9]"  1 1 1 1 1 1 1 1 1 1;
	setAttr -s 10 ".koy[0:9]"  0 0 0 0 0 0 0 0 0 0;
createNode animCurveTL -n "CURVE13";
	rename -uid "5DC84825-4149-9D96-8BAF-338261CFFC27";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 10 ".ktv[0:9]"  0 0 12 0 24 0 32 0 40 0 46 0 52 0 58 0 64 0
		 71 0;
	setAttr -s 10 ".kit[3:9]"  1 1 18 18 18 18 1;
	setAttr -s 10 ".kot[0:9]"  1 18 18 1 1 18 18 18 
		18 18;
	setAttr -s 10 ".kix[3:9]"  1 1 1 1 1 1 1;
	setAttr -s 10 ".kiy[3:9]"  0 0 0 0 0 0 0;
	setAttr -s 10 ".kox[0:9]"  1 1 1 1 1 1 1 1 1 1;
	setAttr -s 10 ".koy[0:9]"  0 0 0 0 0 0 0 0 0 0;
createNode animCurveTL -n "CURVE14";
	rename -uid "A21E40AF-4C7C-5464-BE7D-0DB4EF1FBF4F";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 10 ".ktv[0:9]"  0 0 12 0 24 0 32 0 40 0 46 0 52 0 58 0 64 0
		 71 0;
	setAttr -s 10 ".kit[3:9]"  1 1 18 18 18 18 1;
	setAttr -s 10 ".kot[0:9]"  1 18 18 1 1 18 18 18 
		18 18;
	setAttr -s 10 ".kix[3:9]"  1 1 1 1 1 1 1;
	setAttr -s 10 ".kiy[3:9]"  0 0 0 0 0 0 0;
	setAttr -s 10 ".kox[0:9]"  1 1 1 1 1 1 1 1 1 1;
	setAttr -s 10 ".koy[0:9]"  0 0 0 0 0 0 0 0 0 0;
createNode animCurveTU -n "CURVE15";
	rename -uid "CA5CFDD3-4B2A-78F8-C34B-66ACE528D305";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 10 ".ktv[0:9]"  0 1 12 1 24 1 32 1 40 1 46 1 52 1 58 1 64 1
		 71 1;
	setAttr -s 10 ".kit[3:9]"  1 1 18 18 18 18 1;
	setAttr -s 10 ".kot[0:9]"  1 18 18 1 1 18 18 18 
		18 18;
	setAttr -s 10 ".kix[3:9]"  1 1 1 1 1 1 1;
	setAttr -s 10 ".kiy[3:9]"  0 0 0 0 0 0 0;
	setAttr -s 10 ".kox[0:9]"  1 1 1 1 1 1 1 1 1 1;
	setAttr -s 10 ".koy[0:9]"  0 0 0 0 0 0 0 0 0 0;
createNode animCurveTU -n "CURVE16";
	rename -uid "0BDE8CF8-4161-2E70-7ADC-639F1C5930DB";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 10 ".ktv[0:9]"  0 1 12 1 24 1 32 1 40 1 46 1 52 1 58 1 64 1
		 71 1;
	setAttr -s 10 ".kit[3:9]"  1 1 18 18 18 18 1;
	setAttr -s 10 ".kot[0:9]"  1 18 18 1 1 18 18 18 
		18 18;
	setAttr -s 10 ".kix[3:9]"  1 1 1 1 1 1 1;
	setAttr -s 10 ".kiy[3:9]"  0 0 0 0 0 0 0;
	setAttr -s 10 ".kox[0:9]"  1 1 1 1 1 1 1 1 1 1;
	setAttr -s 10 ".koy[0:9]"  0 0 0 0 0 0 0 0 0 0;
createNode animCurveTU -n "CURVE17";
	rename -uid "51E32DF3-49AE-680A-EA5F-8DB1FB05FF55";
	setAttr ".tan" 5;
	setAttr ".wgt" no;
	setAttr -s 10 ".ktv[0:9]"  0 1 12 1 24 1 32 1 40 1 46 1 52 1 58 1 64 1
		 71 1;
	setAttr -s 10 ".kit[0:9]"  9 9 9 1 1 9 9 9 
		9 1;
	setAttr -s 10 ".kix[3:9]"  1 1 1 1 1 1 1;
	setAttr -s 10 ".kiy[3:9]"  0 0 0 0 0 0 0;
createNode animCurveTA -n "CURVE18";
	rename -uid "8AAD45C3-4587-E13F-68CD-F981A5CC059A";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 10 ".ktv[0:9]"  0 0 12 0 24 0 32 0 40 0 46 0 52 0 58 0 64 0
		 71 3.2980716338246274e-11;
	setAttr -s 10 ".kit[3:9]"  1 1 18 18 18 18 1;
	setAttr -s 10 ".kot[0:9]"  1 18 18 1 1 18 18 18 
		18 18;
	setAttr -s 10 ".kix[3:9]"  1 1 1 1 1 1 1;
	setAttr -s 10 ".kiy[3:9]"  0 0 0 0 0 0 0;
	setAttr -s 10 ".kox[0:9]"  1 1 1 1 1 1 1 1 1 1;
	setAttr -s 10 ".koy[0:9]"  0 0 0 0 0 0 0 0 0 0;
createNode animCurveTA -n "CURVE19";
	rename -uid "85B7FF10-4F08-58A8-F6EC-FFA3D47215F9";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 10 ".ktv[0:9]"  0 0 12 0 24 0 32 0 40 0 46 0 52 0 58 0 64 0
		 71 4.5011015405697551e-05;
	setAttr -s 10 ".kit[3:9]"  1 1 18 18 18 18 1;
	setAttr -s 10 ".kot[0:9]"  1 18 18 1 1 18 18 18 
		18 18;
	setAttr -s 10 ".kix[3:9]"  1 1 1 1 1 1 1;
	setAttr -s 10 ".kiy[3:9]"  0 0 0 0 0 0 0;
	setAttr -s 10 ".kox[0:9]"  1 1 1 1 1 1 1 1 1 1;
	setAttr -s 10 ".koy[0:9]"  0 0 0 0 0 0 0 0 0 0;
createNode animCurveTA -n "CURVE20";
	rename -uid "2F5A7553-4B32-A135-2739-88AEFE85415B";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 10 ".ktv[0:9]"  0 0 12 0 24 0 32 0 40 0 46 0 52 0 58 0 64 0
		 71 -4.3388912156214641e-05;
	setAttr -s 10 ".kit[3:9]"  1 1 18 18 18 18 1;
	setAttr -s 10 ".kot[0:9]"  1 18 18 1 1 18 18 18 
		18 18;
	setAttr -s 10 ".kix[3:9]"  1 1 1 1 1 1 1;
	setAttr -s 10 ".kiy[3:9]"  0 0 0 0 0 0 0;
	setAttr -s 10 ".kox[0:9]"  1 1 1 1 1 1 1 1 1 1;
	setAttr -s 10 ".koy[0:9]"  0 0 0 0 0 0 0 0 0 0;
createNode animCurveTU -n "CURVE21";
	rename -uid "2779098C-4E3E-2486-8192-87BA57FD3B6C";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 10 ".ktv[0:9]"  0 1 12 1 24 1 32 1 40 1 46 1 52 1 58 1 64 1
		 71 1;
	setAttr -s 10 ".kit[3:9]"  1 1 18 18 18 18 1;
	setAttr -s 10 ".kot[0:9]"  1 18 18 1 1 18 18 18 
		18 18;
	setAttr -s 10 ".kix[3:9]"  1 1 1 1 1 1 1;
	setAttr -s 10 ".kiy[3:9]"  0 0 0 0 0 0 0;
	setAttr -s 10 ".kox[0:9]"  1 1 1 1 1 1 1 1 1 1;
	setAttr -s 10 ".koy[0:9]"  0 0 0 0 0 0 0 0 0 0;
createNode animCurveTL -n "CURVE23";
	rename -uid "86B3CA99-460D-B71C-AC06-AA8FD3C6E8BB";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 10 ".ktv[0:9]"  0 0 12 0 24 0 32 0 40 0 46 0 52 0 58 0 64 0
		 71 0;
	setAttr -s 10 ".kit[3:9]"  1 1 18 18 18 18 1;
	setAttr -s 10 ".kot[0:9]"  1 18 18 1 1 18 18 18 
		18 18;
	setAttr -s 10 ".kix[3:9]"  1 1 1 1 1 1 1;
	setAttr -s 10 ".kiy[3:9]"  0 0 0 0 0 0 0;
	setAttr -s 10 ".kox[0:9]"  1 1 1 1 1 1 1 1 1 1;
	setAttr -s 10 ".koy[0:9]"  0 0 0 0 0 0 0 0 0 0;
createNode animCurveTL -n "CURVE24";
	rename -uid "46B98F6A-4167-7F65-9934-489A842018CA";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 10 ".ktv[0:9]"  0 0 12 0 24 0 32 0 40 0 46 0 52 0 58 0 64 0
		 71 0;
	setAttr -s 10 ".kit[3:9]"  1 1 18 18 18 18 1;
	setAttr -s 10 ".kot[0:9]"  1 18 18 1 1 18 18 18 
		18 18;
	setAttr -s 10 ".kix[3:9]"  1 1 1 1 1 1 1;
	setAttr -s 10 ".kiy[3:9]"  0 0 0 0 0 0 0;
	setAttr -s 10 ".kox[0:9]"  1 1 1 1 1 1 1 1 1 1;
	setAttr -s 10 ".koy[0:9]"  0 0 0 0 0 0 0 0 0 0;
createNode animCurveTL -n "CURVE25";
	rename -uid "9D4253EA-4063-03F2-94CA-B58C31FFF9E9";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 10 ".ktv[0:9]"  0 0 12 0 24 0 32 0 40 0 46 0 52 0 58 0 64 0
		 71 0;
	setAttr -s 10 ".kit[3:9]"  1 1 18 18 18 18 1;
	setAttr -s 10 ".kot[0:9]"  1 18 18 1 1 18 18 18 
		18 18;
	setAttr -s 10 ".kix[3:9]"  1 1 1 1 1 1 1;
	setAttr -s 10 ".kiy[3:9]"  0 0 0 0 0 0 0;
	setAttr -s 10 ".kox[0:9]"  1 1 1 1 1 1 1 1 1 1;
	setAttr -s 10 ".koy[0:9]"  0 0 0 0 0 0 0 0 0 0;
createNode animCurveTU -n "CURVE26";
	rename -uid "6CD9D761-4977-B945-C6EB-47837A8C7813";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 10 ".ktv[0:9]"  0 1 12 1 24 1 32 1 40 1 46 1 52 1 58 1 64 1
		 71 1;
	setAttr -s 10 ".kit[3:9]"  1 1 18 18 18 18 1;
	setAttr -s 10 ".kot[0:9]"  1 18 18 1 1 18 18 18 
		18 18;
	setAttr -s 10 ".kix[3:9]"  1 1 1 1 1 1 1;
	setAttr -s 10 ".kiy[3:9]"  0 0 0 0 0 0 0;
	setAttr -s 10 ".kox[0:9]"  1 1 1 1 1 1 1 1 1 1;
	setAttr -s 10 ".koy[0:9]"  0 0 0 0 0 0 0 0 0 0;
createNode animCurveTU -n "CURVE27";
	rename -uid "F2AFC11B-432E-924E-8A87-608DD918D26F";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 10 ".ktv[0:9]"  0 1 12 1 24 1 32 1 40 1 46 1 52 1 58 1 64 1
		 71 1;
	setAttr -s 10 ".kit[3:9]"  1 1 18 18 18 18 1;
	setAttr -s 10 ".kot[0:9]"  1 18 18 1 1 18 18 18 
		18 18;
	setAttr -s 10 ".kix[3:9]"  1 1 1 1 1 1 1;
	setAttr -s 10 ".kiy[3:9]"  0 0 0 0 0 0 0;
	setAttr -s 10 ".kox[0:9]"  1 1 1 1 1 1 1 1 1 1;
	setAttr -s 10 ".koy[0:9]"  0 0 0 0 0 0 0 0 0 0;
createNode animCurveTU -n "CURVE28";
	rename -uid "6807A182-4759-AF3D-186F-1DBFBA5C80B3";
	setAttr ".tan" 5;
	setAttr ".wgt" no;
	setAttr -s 10 ".ktv[0:9]"  0 1 12 1 24 1 32 1 40 1 46 1 52 1 58 1 64 1
		 71 1;
	setAttr -s 10 ".kit[0:9]"  9 9 9 1 1 9 9 9 
		9 1;
	setAttr -s 10 ".kix[3:9]"  1 1 1 1 1 1 1;
	setAttr -s 10 ".kiy[3:9]"  0 0 0 0 0 0 0;
createNode animCurveTA -n "CURVE29";
	rename -uid "81C34D85-4FCC-F2B8-0204-7C8BCD7EAFF3";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 10 ".ktv[0:9]"  0 0 12 0 24 0 32 0 40 0 46 0 52 0 58 0 64 0
		 71 0;
	setAttr -s 10 ".kit[3:9]"  1 1 18 18 18 18 1;
	setAttr -s 10 ".kot[0:9]"  1 18 18 1 1 18 18 18 
		18 18;
	setAttr -s 10 ".kix[3:9]"  1 1 1 1 1 1 1;
	setAttr -s 10 ".kiy[3:9]"  0 0 0 0 0 0 0;
	setAttr -s 10 ".kox[0:9]"  1 1 1 1 1 1 1 1 1 1;
	setAttr -s 10 ".koy[0:9]"  0 0 0 0 0 0 0 0 0 0;
createNode animCurveTA -n "CURVE30";
	rename -uid "3D9399AB-46E8-8B94-DD7B-9B9021417157";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 10 ".ktv[0:9]"  0 0 12 0 24 0 32 0 40 0 46 0 52 0 58 0 64 0
		 71 0;
	setAttr -s 10 ".kit[3:9]"  1 1 18 18 18 18 1;
	setAttr -s 10 ".kot[0:9]"  1 18 18 1 1 18 18 18 
		18 18;
	setAttr -s 10 ".kix[3:9]"  1 1 1 1 1 1 1;
	setAttr -s 10 ".kiy[3:9]"  0 0 0 0 0 0 0;
	setAttr -s 10 ".kox[0:9]"  1 1 1 1 1 1 1 1 1 1;
	setAttr -s 10 ".koy[0:9]"  0 0 0 0 0 0 0 0 0 0;
createNode animCurveTA -n "CURVE31";
	rename -uid "51B4590B-483F-45C6-8181-658A74A9CCBF";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 10 ".ktv[0:9]"  0 0 12 10 24 10 32 0 40 0 46 5 52 5 58 5
		 64 5 71 0;
	setAttr -s 10 ".kit[3:9]"  1 1 18 18 18 18 1;
	setAttr -s 10 ".kot[0:9]"  1 18 18 1 1 18 18 18 
		18 18;
	setAttr -s 10 ".kix[3:9]"  1 1 1 1 1 1 1;
	setAttr -s 10 ".kiy[3:9]"  0 0 0 0 0 0 0;
	setAttr -s 10 ".kox[0:9]"  1 1 1 1 1 1 1 1 1 1;
	setAttr -s 10 ".koy[0:9]"  0 0 0 0 0 0 0 0 0 0;
createNode animCurveTU -n "CURVE32";
	rename -uid "9D215030-43C8-3749-1CFF-29968CE3B1F8";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 10 ".ktv[0:9]"  0 1 12 1 24 1 32 1 40 1 46 1 52 1 58 1 64 1
		 71 1;
	setAttr -s 10 ".kit[3:9]"  1 1 18 18 18 18 1;
	setAttr -s 10 ".kot[0:9]"  1 18 18 1 1 18 18 18 
		18 18;
	setAttr -s 10 ".kix[3:9]"  1 1 1 1 1 1 1;
	setAttr -s 10 ".kiy[3:9]"  0 0 0 0 0 0 0;
	setAttr -s 10 ".kox[0:9]"  1 1 1 1 1 1 1 1 1 1;
	setAttr -s 10 ".koy[0:9]"  0 0 0 0 0 0 0 0 0 0;
createNode animCurveTU -n "CURVE34";
	rename -uid "02417E93-4565-3B40-E531-62B093BC09BD";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 10 ".ktv[0:9]"  0 1 12 1 24 1 32 1 40 1 46 2 52 2 58 2 64 2
		 71 2;
	setAttr -s 10 ".kit[3:9]"  1 1 18 18 18 18 1;
	setAttr -s 10 ".kot[0:9]"  1 18 18 1 1 18 18 18 
		18 18;
	setAttr -s 10 ".kix[3:9]"  1 1 1 1 1 1 1;
	setAttr -s 10 ".kiy[3:9]"  0 0 0 0 0 0 0;
	setAttr -s 10 ".kox[0:9]"  1 1 1 1 1 1 1 1 1 1;
	setAttr -s 10 ".koy[0:9]"  0 0 0 0 0 0 0 0 0 0;
createNode animCurveTU -n "CURVE35";
	rename -uid "C1A03B61-4C65-FC4D-1E81-B3BF250ACE81";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 10 ".ktv[0:9]"  0 0 12 0 24 0 32 0 40 0 46 0 52 0 58 0 64 0
		 71 0;
	setAttr -s 10 ".kit[3:9]"  1 1 18 18 18 18 1;
	setAttr -s 10 ".kot[0:9]"  1 18 18 1 1 18 18 18 
		18 18;
	setAttr -s 10 ".kix[3:9]"  1 1 1 1 1 1 1;
	setAttr -s 10 ".kiy[3:9]"  0 0 0 0 0 0 0;
	setAttr -s 10 ".kox[0:9]"  1 1 1 1 1 1 1 1 1 1;
	setAttr -s 10 ".koy[0:9]"  0 0 0 0 0 0 0 0 0 0;
createNode animCurveTU -n "CURVE36";
	rename -uid "DD880400-4A2B-5CFC-31B4-E3A200172B38";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 10 ".ktv[0:9]"  0 1 12 1 24 1 32 1 40 1 46 2 52 2 58 2 64 2
		 71 2;
	setAttr -s 10 ".kit[3:9]"  1 1 18 18 18 18 1;
	setAttr -s 10 ".kot[0:9]"  1 18 18 1 1 18 18 18 
		18 18;
	setAttr -s 10 ".kix[3:9]"  1 1 1 1 1 1 1;
	setAttr -s 10 ".kiy[3:9]"  0 0 0 0 0 0 0;
	setAttr -s 10 ".kox[0:9]"  1 1 1 1 1 1 1 1 1 1;
	setAttr -s 10 ".koy[0:9]"  0 0 0 0 0 0 0 0 0 0;
createNode animCurveTU -n "CURVE37";
	rename -uid "4AF114D7-4AB5-761A-EFEA-E2B57120DF43";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 10 ".ktv[0:9]"  0 0 12 0 24 0 32 0 40 0 46 0 52 0 58 0 64 0
		 71 0;
	setAttr -s 10 ".kit[3:9]"  1 1 18 18 18 18 1;
	setAttr -s 10 ".kot[0:9]"  1 18 18 1 1 18 18 18 
		18 18;
	setAttr -s 10 ".kix[3:9]"  1 1 1 1 1 1 1;
	setAttr -s 10 ".kiy[3:9]"  0 0 0 0 0 0 0;
	setAttr -s 10 ".kox[0:9]"  1 1 1 1 1 1 1 1 1 1;
	setAttr -s 10 ".koy[0:9]"  0 0 0 0 0 0 0 0 0 0;
createNode animCurveTU -n "CURVE38";
	rename -uid "885A3796-4FA9-702B-3981-039F0C29CB61";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 10 ".ktv[0:9]"  0 1 12 1 24 1 32 1 40 1 46 2 52 2 58 2 64 2
		 71 2;
	setAttr -s 10 ".kit[3:9]"  1 1 18 18 18 18 1;
	setAttr -s 10 ".kot[0:9]"  1 18 18 1 1 18 18 18 
		18 18;
	setAttr -s 10 ".kix[3:9]"  1 1 1 1 1 1 1;
	setAttr -s 10 ".kiy[3:9]"  0 0 0 0 0 0 0;
	setAttr -s 10 ".kox[0:9]"  1 1 1 1 1 1 1 1 1 1;
	setAttr -s 10 ".koy[0:9]"  0 0 0 0 0 0 0 0 0 0;
createNode animCurveTU -n "CURVE39";
	rename -uid "E3CA43A2-4523-8A35-9EF7-5EB74132B11B";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 10 ".ktv[0:9]"  0 1 12 1 24 1 32 1 40 1 46 2 52 2 58 2 64 2
		 71 2;
	setAttr -s 10 ".kit[3:9]"  1 1 18 18 18 18 1;
	setAttr -s 10 ".kot[0:9]"  1 18 18 1 1 18 18 18 
		18 18;
	setAttr -s 10 ".kix[3:9]"  1 1 1 1 1 1 1;
	setAttr -s 10 ".kiy[3:9]"  0 0 0 0 0 0 0;
	setAttr -s 10 ".kox[0:9]"  1 1 1 1 1 1 1 1 1 1;
	setAttr -s 10 ".koy[0:9]"  0 0 0 0 0 0 0 0 0 0;
createNode animCurveTU -n "CURVE40";
	rename -uid "C730E4C2-412F-A872-B6BC-4D95727E87B3";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 10 ".ktv[0:9]"  0 1 12 1 24 1 32 1 40 1 46 2 52 2 58 2 64 2
		 71 2;
	setAttr -s 10 ".kit[3:9]"  1 1 18 18 18 18 1;
	setAttr -s 10 ".kot[0:9]"  1 18 18 1 1 18 18 18 
		18 18;
	setAttr -s 10 ".kix[3:9]"  1 1 1 1 1 1 1;
	setAttr -s 10 ".kiy[3:9]"  0 0 0 0 0 0 0;
	setAttr -s 10 ".kox[0:9]"  1 1 1 1 1 1 1 1 1 1;
	setAttr -s 10 ".koy[0:9]"  0 0 0 0 0 0 0 0 0 0;
createNode animCurveTL -n "CURVE42";
	rename -uid "10266B81-406E-D20C-94A2-12834E0EEB5D";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 10 ".ktv[0:9]"  0 0 12 0 24 0 32 0 40 0 46 0 52 0 58 0 64 0
		 71 0;
	setAttr -s 10 ".kit[3:9]"  1 1 18 18 18 18 1;
	setAttr -s 10 ".kot[0:9]"  1 18 18 1 1 18 18 18 
		18 18;
	setAttr -s 10 ".kix[3:9]"  1 1 1 1 1 1 1;
	setAttr -s 10 ".kiy[3:9]"  0 0 0 0 0 0 0;
	setAttr -s 10 ".kox[0:9]"  1 1 1 1 1 1 1 1 1 1;
	setAttr -s 10 ".koy[0:9]"  0 0 0 0 0 0 0 0 0 0;
createNode animCurveTL -n "CURVE43";
	rename -uid "B6338509-4A96-4D7A-12F0-599CE43FAA90";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 10 ".ktv[0:9]"  0 0 12 0 24 0 32 0 40 0 46 0 52 0 58 0 64 0
		 71 0;
	setAttr -s 10 ".kit[3:9]"  1 1 18 18 18 18 1;
	setAttr -s 10 ".kot[0:9]"  1 18 18 1 1 18 18 18 
		18 18;
	setAttr -s 10 ".kix[3:9]"  1 1 1 1 1 1 1;
	setAttr -s 10 ".kiy[3:9]"  0 0 0 0 0 0 0;
	setAttr -s 10 ".kox[0:9]"  1 1 1 1 1 1 1 1 1 1;
	setAttr -s 10 ".koy[0:9]"  0 0 0 0 0 0 0 0 0 0;
createNode animCurveTL -n "CURVE44";
	rename -uid "B1243D11-41BF-1ED8-7EF7-ADB42BA30942";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 10 ".ktv[0:9]"  0 0 12 0 24 0 32 0 40 0 46 0 52 0 58 0 64 0
		 71 0;
	setAttr -s 10 ".kit[3:9]"  1 1 18 18 18 18 1;
	setAttr -s 10 ".kot[0:9]"  1 18 18 1 1 18 18 18 
		18 18;
	setAttr -s 10 ".kix[3:9]"  1 1 1 1 1 1 1;
	setAttr -s 10 ".kiy[3:9]"  0 0 0 0 0 0 0;
	setAttr -s 10 ".kox[0:9]"  1 1 1 1 1 1 1 1 1 1;
	setAttr -s 10 ".koy[0:9]"  0 0 0 0 0 0 0 0 0 0;
createNode animCurveTU -n "CURVE45";
	rename -uid "3B89B18B-433E-3E75-350B-D38616352F06";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 10 ".ktv[0:9]"  0 1 12 1 24 1 32 1 40 1 46 1 52 1 58 1 64 1
		 71 1;
	setAttr -s 10 ".kit[3:9]"  1 1 18 18 18 18 1;
	setAttr -s 10 ".kot[0:9]"  1 18 18 1 1 18 18 18 
		18 18;
	setAttr -s 10 ".kix[3:9]"  1 1 1 1 1 1 1;
	setAttr -s 10 ".kiy[3:9]"  0 0 0 0 0 0 0;
	setAttr -s 10 ".kox[0:9]"  1 1 1 1 1 1 1 1 1 1;
	setAttr -s 10 ".koy[0:9]"  0 0 0 0 0 0 0 0 0 0;
createNode animCurveTU -n "CURVE46";
	rename -uid "DA2D9EBA-49F7-5CCA-146D-4F9DD49892A3";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 10 ".ktv[0:9]"  0 1 12 1 24 1 32 1 40 1 46 1 52 1 58 1 64 1
		 71 1;
	setAttr -s 10 ".kit[3:9]"  1 1 18 18 18 18 1;
	setAttr -s 10 ".kot[0:9]"  1 18 18 1 1 18 18 18 
		18 18;
	setAttr -s 10 ".kix[3:9]"  1 1 1 1 1 1 1;
	setAttr -s 10 ".kiy[3:9]"  0 0 0 0 0 0 0;
	setAttr -s 10 ".kox[0:9]"  1 1 1 1 1 1 1 1 1 1;
	setAttr -s 10 ".koy[0:9]"  0 0 0 0 0 0 0 0 0 0;
createNode animCurveTU -n "CURVE47";
	rename -uid "08A97EDB-4546-266F-8A4C-DA87D6F72A33";
	setAttr ".tan" 5;
	setAttr ".wgt" no;
	setAttr -s 10 ".ktv[0:9]"  0 1 12 1 24 1 32 1 40 1 46 1 52 1 58 1 64 1
		 71 1;
	setAttr -s 10 ".kit[0:9]"  9 9 9 1 1 9 9 9 
		9 1;
	setAttr -s 10 ".kix[3:9]"  1 1 1 1 1 1 1;
	setAttr -s 10 ".kiy[3:9]"  0 0 0 0 0 0 0;
createNode animCurveTA -n "CURVE48";
	rename -uid "B9CEF27E-4925-28C9-C2B9-6A8496A53E31";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 10 ".ktv[0:9]"  0 0 12 0 24 0 32 0 40 0 46 0 52 0 58 0 64 0
		 71 0;
	setAttr -s 10 ".kit[3:9]"  1 1 18 18 18 18 1;
	setAttr -s 10 ".kot[0:9]"  1 18 18 1 1 18 18 18 
		18 18;
	setAttr -s 10 ".kix[3:9]"  1 1 1 1 1 1 1;
	setAttr -s 10 ".kiy[3:9]"  0 0 0 0 0 0 0;
	setAttr -s 10 ".kox[0:9]"  1 1 1 1 1 1 1 1 1 1;
	setAttr -s 10 ".koy[0:9]"  0 0 0 0 0 0 0 0 0 0;
createNode animCurveTA -n "CURVE49";
	rename -uid "8754ED0C-40A1-C4CA-C157-24B62199781D";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 10 ".ktv[0:9]"  0 0 12 0 24 0 32 0 40 0 46 0 52 0 58 0 64 0
		 71 0;
	setAttr -s 10 ".kit[3:9]"  1 1 18 18 18 18 1;
	setAttr -s 10 ".kot[0:9]"  1 18 18 1 1 18 18 18 
		18 18;
	setAttr -s 10 ".kix[3:9]"  1 1 1 1 1 1 1;
	setAttr -s 10 ".kiy[3:9]"  0 0 0 0 0 0 0;
	setAttr -s 10 ".kox[0:9]"  1 1 1 1 1 1 1 1 1 1;
	setAttr -s 10 ".koy[0:9]"  0 0 0 0 0 0 0 0 0 0;
createNode animCurveTA -n "CURVE50";
	rename -uid "096BBFD1-4A6D-A36D-700D-378927D95EE4";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 10 ".ktv[0:9]"  0 0 12 0 24 0 32 0 40 0 46 5 52 5 58 5 64 5
		 71 5;
	setAttr -s 10 ".kit[3:9]"  1 1 18 18 18 18 1;
	setAttr -s 10 ".kot[0:9]"  1 18 18 1 1 18 18 18 
		18 18;
	setAttr -s 10 ".kix[3:9]"  1 1 1 1 1 1 1;
	setAttr -s 10 ".kiy[3:9]"  0 0 0 0 0 0 0;
	setAttr -s 10 ".kox[0:9]"  1 1 1 1 1 1 1 1 1 1;
	setAttr -s 10 ".koy[0:9]"  0 0 0 0 0 0 0 0 0 0;
createNode animCurveTU -n "CURVE51";
	rename -uid "43B0C89E-464C-7946-5D79-E7ADFB6ABB92";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 10 ".ktv[0:9]"  0 1 12 1 24 1 32 1 40 1 46 1 52 1 58 1 64 1
		 71 1;
	setAttr -s 10 ".kit[3:9]"  1 1 18 18 18 18 1;
	setAttr -s 10 ".kot[0:9]"  1 18 18 1 1 18 18 18 
		18 18;
	setAttr -s 10 ".kix[3:9]"  1 1 1 1 1 1 1;
	setAttr -s 10 ".kiy[3:9]"  0 0 0 0 0 0 0;
	setAttr -s 10 ".kox[0:9]"  1 1 1 1 1 1 1 1 1 1;
	setAttr -s 10 ".koy[0:9]"  0 0 0 0 0 0 0 0 0 0;
createNode animCurveTL -n "CURVE53";
	rename -uid "EE90E501-4FC1-9BCB-F4E6-61981C23675F";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 10 ".ktv[0:9]"  0 0 12 0 24 0 32 0 40 0 46 0 52 0 58 0 64 0
		 71 0;
	setAttr -s 10 ".kit[3:9]"  1 1 18 18 18 18 1;
	setAttr -s 10 ".kot[0:9]"  1 18 18 1 1 18 18 18 
		18 18;
	setAttr -s 10 ".kix[3:9]"  1 1 1 1 1 1 1;
	setAttr -s 10 ".kiy[3:9]"  0 0 0 0 0 0 0;
	setAttr -s 10 ".kox[0:9]"  1 1 1 1 1 1 1 1 1 1;
	setAttr -s 10 ".koy[0:9]"  0 0 0 0 0 0 0 0 0 0;
createNode animCurveTL -n "CURVE54";
	rename -uid "559AE0A9-40EE-1080-E22F-5FB854EA0F24";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 10 ".ktv[0:9]"  0 0 12 0 24 0 32 0 40 0 46 0 52 0 58 0 64 0
		 71 0;
	setAttr -s 10 ".kit[3:9]"  1 1 18 18 18 18 1;
	setAttr -s 10 ".kot[0:9]"  1 18 18 1 1 18 18 18 
		18 18;
	setAttr -s 10 ".kix[3:9]"  1 1 1 1 1 1 1;
	setAttr -s 10 ".kiy[3:9]"  0 0 0 0 0 0 0;
	setAttr -s 10 ".kox[0:9]"  1 1 1 1 1 1 1 1 1 1;
	setAttr -s 10 ".koy[0:9]"  0 0 0 0 0 0 0 0 0 0;
createNode animCurveTL -n "CURVE55";
	rename -uid "1CF697DE-4261-D10F-6394-429337EFF32F";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 10 ".ktv[0:9]"  0 0 12 0 24 0 32 0 40 0 46 0 52 0 58 0 64 0
		 71 0;
	setAttr -s 10 ".kit[3:9]"  1 1 18 18 18 18 1;
	setAttr -s 10 ".kot[0:9]"  1 18 18 1 1 18 18 18 
		18 18;
	setAttr -s 10 ".kix[3:9]"  1 1 1 1 1 1 1;
	setAttr -s 10 ".kiy[3:9]"  0 0 0 0 0 0 0;
	setAttr -s 10 ".kox[0:9]"  1 1 1 1 1 1 1 1 1 1;
	setAttr -s 10 ".koy[0:9]"  0 0 0 0 0 0 0 0 0 0;
createNode animCurveTU -n "CURVE56";
	rename -uid "4C0E7BAF-4C8E-0E69-29E9-E0864ED51DA9";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 10 ".ktv[0:9]"  0 1 12 1 24 1 32 1 40 1 46 1 52 1 58 1 64 1
		 71 1;
	setAttr -s 10 ".kit[3:9]"  1 1 18 18 18 18 1;
	setAttr -s 10 ".kot[0:9]"  1 18 18 1 1 18 18 18 
		18 18;
	setAttr -s 10 ".kix[3:9]"  1 1 1 1 1 1 1;
	setAttr -s 10 ".kiy[3:9]"  0 0 0 0 0 0 0;
	setAttr -s 10 ".kox[0:9]"  1 1 1 1 1 1 1 1 1 1;
	setAttr -s 10 ".koy[0:9]"  0 0 0 0 0 0 0 0 0 0;
createNode animCurveTU -n "CURVE57";
	rename -uid "B7F1730F-4336-D8A3-6CB4-1F96E08E68BF";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 10 ".ktv[0:9]"  0 1 12 1 24 1 32 1 40 1 46 1 52 1 58 1 64 1
		 71 1;
	setAttr -s 10 ".kit[3:9]"  1 1 18 18 18 18 1;
	setAttr -s 10 ".kot[0:9]"  1 18 18 1 1 18 18 18 
		18 18;
	setAttr -s 10 ".kix[3:9]"  1 1 1 1 1 1 1;
	setAttr -s 10 ".kiy[3:9]"  0 0 0 0 0 0 0;
	setAttr -s 10 ".kox[0:9]"  1 1 1 1 1 1 1 1 1 1;
	setAttr -s 10 ".koy[0:9]"  0 0 0 0 0 0 0 0 0 0;
createNode animCurveTU -n "CURVE58";
	rename -uid "13D4A2EB-439A-57EE-BFBC-C69B7132F8BE";
	setAttr ".tan" 5;
	setAttr ".wgt" no;
	setAttr -s 10 ".ktv[0:9]"  0 1 12 1 24 1 32 1 40 1 46 1 52 1 58 1 64 1
		 71 1;
	setAttr -s 10 ".kit[0:9]"  9 9 9 1 1 9 9 9 
		9 1;
	setAttr -s 10 ".kix[3:9]"  1 1 1 1 1 1 1;
	setAttr -s 10 ".kiy[3:9]"  0 0 0 0 0 0 0;
createNode animCurveTA -n "CURVE59";
	rename -uid "92A58155-4215-D593-B37D-52A0A302FC66";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 10 ".ktv[0:9]"  0 0 12 0 24 0 32 0 40 0 46 0 52 0 58 0 64 0
		 71 -1.2722223035317961e-14;
	setAttr -s 10 ".kit[3:9]"  1 1 18 18 18 18 1;
	setAttr -s 10 ".kot[0:9]"  1 18 18 1 1 18 18 18 
		18 18;
	setAttr -s 10 ".kix[3:9]"  1 1 1 1 1 1 1;
	setAttr -s 10 ".kiy[3:9]"  0 0 0 0 0 0 0;
	setAttr -s 10 ".kox[0:9]"  1 1 1 1 1 1 1 1 1 1;
	setAttr -s 10 ".koy[0:9]"  0 0 0 0 0 0 0 0 0 0;
createNode animCurveTA -n "CURVE60";
	rename -uid "0597CF60-477A-5EC4-FCD2-4AA72D390142";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 10 ".ktv[0:9]"  0 0 12 0 24 0 32 0 40 0 46 0 52 0 58 0 64 0
		 71 6.3611007439919413e-15;
	setAttr -s 10 ".kit[3:9]"  1 1 18 18 18 18 1;
	setAttr -s 10 ".kot[0:9]"  1 18 18 1 1 18 18 18 
		18 18;
	setAttr -s 10 ".kix[3:9]"  1 1 1 1 1 1 1;
	setAttr -s 10 ".kiy[3:9]"  0 0 0 0 0 0 0;
	setAttr -s 10 ".kox[0:9]"  1 1 1 1 1 1 1 1 1 1;
	setAttr -s 10 ".koy[0:9]"  0 0 0 0 0 0 0 0 0 0;
createNode animCurveTA -n "CURVE61";
	rename -uid "DB2AE938-4DCC-7589-B71C-E4B63E981958";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 10 ".ktv[0:9]"  0 0 12 0 24 0 32 0 40 0 46 0 52 0 58 0 64 0
		 71 7.7632452585095721e-05;
	setAttr -s 10 ".kit[3:9]"  1 1 18 18 18 18 1;
	setAttr -s 10 ".kot[0:9]"  1 18 18 1 1 18 18 18 
		18 18;
	setAttr -s 10 ".kix[3:9]"  1 1 1 1 1 1 1;
	setAttr -s 10 ".kiy[3:9]"  0 0 0 0 0 0 0;
	setAttr -s 10 ".kox[0:9]"  1 1 1 1 1 1 1 1 1 1;
	setAttr -s 10 ".koy[0:9]"  0 0 0 0 0 0 0 0 0 0;
createNode animCurveTU -n "CURVE62";
	rename -uid "8160B251-44C2-99DD-811C-169DE9EE8116";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 10 ".ktv[0:9]"  0 1 12 1 24 1 32 1 40 1 46 1 52 1 58 1 64 1
		 71 1;
	setAttr -s 10 ".kit[3:9]"  1 1 18 18 18 18 1;
	setAttr -s 10 ".kot[0:9]"  1 18 18 1 1 18 18 18 
		18 18;
	setAttr -s 10 ".kix[3:9]"  1 1 1 1 1 1 1;
	setAttr -s 10 ".kiy[3:9]"  0 0 0 0 0 0 0;
	setAttr -s 10 ".kox[0:9]"  1 1 1 1 1 1 1 1 1 1;
	setAttr -s 10 ".koy[0:9]"  0 0 0 0 0 0 0 0 0 0;
createNode animCurveTL -n "CURVE64";
	rename -uid "0E3EC0F6-459B-2AAF-E92E-E88AB8C48E66";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 10 ".ktv[0:9]"  0 0 12 0 24 0 32 0 40 0 46 0 52 0 58 0 64 0
		 71 0;
	setAttr -s 10 ".kit[3:9]"  1 1 18 18 18 18 1;
	setAttr -s 10 ".kot[0:9]"  1 18 18 1 1 18 18 18 
		18 18;
	setAttr -s 10 ".kix[3:9]"  1 1 1 1 1 1 1;
	setAttr -s 10 ".kiy[3:9]"  0 0 0 0 0 0 0;
	setAttr -s 10 ".kox[0:9]"  1 1 1 1 1 1 1 1 1 1;
	setAttr -s 10 ".koy[0:9]"  0 0 0 0 0 0 0 0 0 0;
createNode animCurveTL -n "CURVE65";
	rename -uid "BEE52AA3-4A47-8C2A-6FB5-8290EA172C88";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 10 ".ktv[0:9]"  0 0 12 0 24 0 32 0 40 0 46 0 52 0 58 0 64 0
		 71 0;
	setAttr -s 10 ".kit[3:9]"  1 1 18 18 18 18 1;
	setAttr -s 10 ".kot[0:9]"  1 18 18 1 1 18 18 18 
		18 18;
	setAttr -s 10 ".kix[3:9]"  1 1 1 1 1 1 1;
	setAttr -s 10 ".kiy[3:9]"  0 0 0 0 0 0 0;
	setAttr -s 10 ".kox[0:9]"  1 1 1 1 1 1 1 1 1 1;
	setAttr -s 10 ".koy[0:9]"  0 0 0 0 0 0 0 0 0 0;
createNode animCurveTL -n "CURVE66";
	rename -uid "CD4C8FFF-45DC-084C-8931-75BF994AB203";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 10 ".ktv[0:9]"  0 0 12 0 24 0 32 0 40 0 46 0 52 0 58 0 64 0
		 71 0;
	setAttr -s 10 ".kit[3:9]"  1 1 18 18 18 18 1;
	setAttr -s 10 ".kot[0:9]"  1 18 18 1 1 18 18 18 
		18 18;
	setAttr -s 10 ".kix[3:9]"  1 1 1 1 1 1 1;
	setAttr -s 10 ".kiy[3:9]"  0 0 0 0 0 0 0;
	setAttr -s 10 ".kox[0:9]"  1 1 1 1 1 1 1 1 1 1;
	setAttr -s 10 ".koy[0:9]"  0 0 0 0 0 0 0 0 0 0;
createNode animCurveTU -n "CURVE67";
	rename -uid "F3FB6AD0-42FF-D7B2-734A-C6B246A10941";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 10 ".ktv[0:9]"  0 1 12 1 24 1 32 1 40 1 46 1 52 1 58 1 64 1
		 71 1;
	setAttr -s 10 ".kit[3:9]"  1 1 18 18 18 18 1;
	setAttr -s 10 ".kot[0:9]"  1 18 18 1 1 18 18 18 
		18 18;
	setAttr -s 10 ".kix[3:9]"  1 1 1 1 1 1 1;
	setAttr -s 10 ".kiy[3:9]"  0 0 0 0 0 0 0;
	setAttr -s 10 ".kox[0:9]"  1 1 1 1 1 1 1 1 1 1;
	setAttr -s 10 ".koy[0:9]"  0 0 0 0 0 0 0 0 0 0;
createNode animCurveTU -n "CURVE68";
	rename -uid "975F912F-4B14-6443-2A07-64B44E29D05E";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 10 ".ktv[0:9]"  0 1 12 1 24 1 32 1 40 1 46 1 52 1 58 1 64 1
		 71 1;
	setAttr -s 10 ".kit[3:9]"  1 1 18 18 18 18 1;
	setAttr -s 10 ".kot[0:9]"  1 18 18 1 1 18 18 18 
		18 18;
	setAttr -s 10 ".kix[3:9]"  1 1 1 1 1 1 1;
	setAttr -s 10 ".kiy[3:9]"  0 0 0 0 0 0 0;
	setAttr -s 10 ".kox[0:9]"  1 1 1 1 1 1 1 1 1 1;
	setAttr -s 10 ".koy[0:9]"  0 0 0 0 0 0 0 0 0 0;
createNode animCurveTU -n "CURVE69";
	rename -uid "706CCD90-4E68-2B8C-51F9-C2BFC2B1C7E3";
	setAttr ".tan" 5;
	setAttr ".wgt" no;
	setAttr -s 10 ".ktv[0:9]"  0 1 12 1 24 1 32 1 40 1 46 1 52 1 58 1 64 1
		 71 1;
	setAttr -s 10 ".kit[0:9]"  9 9 9 1 1 9 9 9 
		9 1;
	setAttr -s 10 ".kix[3:9]"  1 1 1 1 1 1 1;
	setAttr -s 10 ".kiy[3:9]"  0 0 0 0 0 0 0;
createNode animCurveTA -n "CURVE70";
	rename -uid "D0E5CF1F-4309-4629-8E12-8796FA8C1294";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 10 ".ktv[0:9]"  0 0 12 0 24 0 32 0 40 0 46 0 52 0 58 0 64 0
		 71 0;
	setAttr -s 10 ".kit[3:9]"  1 1 18 18 18 18 1;
	setAttr -s 10 ".kot[0:9]"  1 18 18 1 1 18 18 18 
		18 18;
	setAttr -s 10 ".kix[3:9]"  1 1 1 1 1 1 1;
	setAttr -s 10 ".kiy[3:9]"  0 0 0 0 0 0 0;
	setAttr -s 10 ".kox[0:9]"  1 1 1 1 1 1 1 1 1 1;
	setAttr -s 10 ".koy[0:9]"  0 0 0 0 0 0 0 0 0 0;
createNode animCurveTA -n "CURVE71";
	rename -uid "246BEE12-4945-CCF5-ECB8-F6BC37C87ADA";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 10 ".ktv[0:9]"  0 0 12 0 24 0 32 0 40 0 46 0 52 0 58 0 64 0
		 71 0;
	setAttr -s 10 ".kit[3:9]"  1 1 18 18 18 18 1;
	setAttr -s 10 ".kot[0:9]"  1 18 18 1 1 18 18 18 
		18 18;
	setAttr -s 10 ".kix[3:9]"  1 1 1 1 1 1 1;
	setAttr -s 10 ".kiy[3:9]"  0 0 0 0 0 0 0;
	setAttr -s 10 ".kox[0:9]"  1 1 1 1 1 1 1 1 1 1;
	setAttr -s 10 ".koy[0:9]"  0 0 0 0 0 0 0 0 0 0;
createNode animCurveTA -n "CURVE72";
	rename -uid "37B77DAF-48BC-9B36-54F3-A393FBB4C53D";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 10 ".ktv[0:9]"  0 0 12 0 24 0 32 0 40 0 46 0 52 0 58 0 64 0
		 71 0;
	setAttr -s 10 ".kit[3:9]"  1 1 18 18 18 18 1;
	setAttr -s 10 ".kot[0:9]"  1 18 18 1 1 18 18 18 
		18 18;
	setAttr -s 10 ".kix[3:9]"  1 1 1 1 1 1 1;
	setAttr -s 10 ".kiy[3:9]"  0 0 0 0 0 0 0;
	setAttr -s 10 ".kox[0:9]"  1 1 1 1 1 1 1 1 1 1;
	setAttr -s 10 ".koy[0:9]"  0 0 0 0 0 0 0 0 0 0;
createNode animCurveTU -n "CURVE73";
	rename -uid "001552D9-46C9-8B82-EAA4-0E933CA4058B";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 10 ".ktv[0:9]"  0 1 12 1 24 1 32 1 40 1 46 1 52 1 58 1 64 1
		 71 1;
	setAttr -s 10 ".kit[3:9]"  1 1 18 18 18 18 1;
	setAttr -s 10 ".kot[0:9]"  1 18 18 1 1 18 18 18 
		18 18;
	setAttr -s 10 ".kix[3:9]"  1 1 1 1 1 1 1;
	setAttr -s 10 ".kiy[3:9]"  0 0 0 0 0 0 0;
	setAttr -s 10 ".kox[0:9]"  1 1 1 1 1 1 1 1 1 1;
	setAttr -s 10 ".koy[0:9]"  0 0 0 0 0 0 0 0 0 0;
createNode animCurveTL -n "CURVE75";
	rename -uid "77075C6B-48BA-0E85-67F0-C7910B189001";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 10 ".ktv[0:9]"  0 0 12 0 24 0 32 0 40 0 46 0 52 0 58 0 64 0
		 71 0;
	setAttr -s 10 ".kit[3:9]"  1 1 18 18 18 18 1;
	setAttr -s 10 ".kot[0:9]"  1 18 18 1 1 18 18 18 
		18 18;
	setAttr -s 10 ".kix[3:9]"  1 1 1 1 1 1 1;
	setAttr -s 10 ".kiy[3:9]"  0 0 0 0 0 0 0;
	setAttr -s 10 ".kox[0:9]"  1 1 1 1 1 1 1 1 1 1;
	setAttr -s 10 ".koy[0:9]"  0 0 0 0 0 0 0 0 0 0;
createNode animCurveTL -n "CURVE76";
	rename -uid "397AEE53-4E2E-2DD1-57FB-CB9AD44F81B5";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 10 ".ktv[0:9]"  0 0 12 0 24 0 32 0 40 0 46 0 52 0 58 0 64 0
		 71 0;
	setAttr -s 10 ".kit[3:9]"  1 1 18 18 18 18 1;
	setAttr -s 10 ".kot[0:9]"  1 18 18 1 1 18 18 18 
		18 18;
	setAttr -s 10 ".kix[3:9]"  1 1 1 1 1 1 1;
	setAttr -s 10 ".kiy[3:9]"  0 0 0 0 0 0 0;
	setAttr -s 10 ".kox[0:9]"  1 1 1 1 1 1 1 1 1 1;
	setAttr -s 10 ".koy[0:9]"  0 0 0 0 0 0 0 0 0 0;
createNode animCurveTL -n "CURVE77";
	rename -uid "AAD80051-45CE-1A26-51AB-92B4FD163749";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 10 ".ktv[0:9]"  0 0 12 0 24 0 32 0 40 0 46 0 52 0 58 0 64 0
		 71 0;
	setAttr -s 10 ".kit[3:9]"  1 1 18 18 18 18 1;
	setAttr -s 10 ".kot[0:9]"  1 18 18 1 1 18 18 18 
		18 18;
	setAttr -s 10 ".kix[3:9]"  1 1 1 1 1 1 1;
	setAttr -s 10 ".kiy[3:9]"  0 0 0 0 0 0 0;
	setAttr -s 10 ".kox[0:9]"  1 1 1 1 1 1 1 1 1 1;
	setAttr -s 10 ".koy[0:9]"  0 0 0 0 0 0 0 0 0 0;
createNode animCurveTU -n "CURVE78";
	rename -uid "F315F946-4B14-8814-4A82-13AEDAEC1D86";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 10 ".ktv[0:9]"  0 1 12 1 24 1 32 1 40 1 46 1 52 1 58 1 64 1
		 71 1;
	setAttr -s 10 ".kit[3:9]"  1 1 18 18 18 18 1;
	setAttr -s 10 ".kot[0:9]"  1 18 18 1 1 18 18 18 
		18 18;
	setAttr -s 10 ".kix[3:9]"  1 1 1 1 1 1 1;
	setAttr -s 10 ".kiy[3:9]"  0 0 0 0 0 0 0;
	setAttr -s 10 ".kox[0:9]"  1 1 1 1 1 1 1 1 1 1;
	setAttr -s 10 ".koy[0:9]"  0 0 0 0 0 0 0 0 0 0;
createNode animCurveTU -n "CURVE79";
	rename -uid "2D4526ED-440C-B5C2-603E-60A8EFEC8866";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 10 ".ktv[0:9]"  0 1 12 1 24 1 32 1 40 1 46 1 52 1 58 1 64 1
		 71 1;
	setAttr -s 10 ".kit[3:9]"  1 1 18 18 18 18 1;
	setAttr -s 10 ".kot[0:9]"  1 18 18 1 1 18 18 18 
		18 18;
	setAttr -s 10 ".kix[3:9]"  1 1 1 1 1 1 1;
	setAttr -s 10 ".kiy[3:9]"  0 0 0 0 0 0 0;
	setAttr -s 10 ".kox[0:9]"  1 1 1 1 1 1 1 1 1 1;
	setAttr -s 10 ".koy[0:9]"  0 0 0 0 0 0 0 0 0 0;
createNode animCurveTU -n "CURVE80";
	rename -uid "7A5A470D-4632-5DD2-DCE7-1187BA98E103";
	setAttr ".tan" 5;
	setAttr ".wgt" no;
	setAttr -s 10 ".ktv[0:9]"  0 1 12 1 24 1 32 1 40 1 46 1 52 1 58 1 64 1
		 71 1;
	setAttr -s 10 ".kit[0:9]"  9 9 9 1 1 9 9 9 
		9 1;
	setAttr -s 10 ".kix[3:9]"  1 1 1 1 1 1 1;
	setAttr -s 10 ".kiy[3:9]"  0 0 0 0 0 0 0;
createNode animCurveTA -n "CURVE81";
	rename -uid "9DE2D61B-413B-F876-EA6C-5DA324C7CE35";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 10 ".ktv[0:9]"  0 0 12 0 24 0 32 0 40 0 46 0 52 0 58 0 64 0
		 71 6.3611102976817237e-15;
	setAttr -s 10 ".kit[3:9]"  1 1 18 18 18 18 1;
	setAttr -s 10 ".kot[0:9]"  1 18 18 1 1 18 18 18 
		18 18;
	setAttr -s 10 ".kix[3:9]"  1 1 1 1 1 1 1;
	setAttr -s 10 ".kiy[3:9]"  0 0 0 0 0 0 0;
	setAttr -s 10 ".kox[0:9]"  1 1 1 1 1 1 1 1 1 1;
	setAttr -s 10 ".koy[0:9]"  0 0 0 0 0 0 0 0 0 0;
createNode animCurveTA -n "CURVE82";
	rename -uid "0498A37D-4CFA-489F-F858-879410FED4F9";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 10 ".ktv[0:9]"  0 0 12 0 24 0 32 0 40 0 46 0 52 0 58 0 64 0
		 71 3.180552811953453e-15;
	setAttr -s 10 ".kit[3:9]"  1 1 18 18 18 18 1;
	setAttr -s 10 ".kot[0:9]"  1 18 18 1 1 18 18 18 
		18 18;
	setAttr -s 10 ".kix[3:9]"  1 1 1 1 1 1 1;
	setAttr -s 10 ".kiy[3:9]"  0 0 0 0 0 0 0;
	setAttr -s 10 ".kox[0:9]"  1 1 1 1 1 1 1 1 1 1;
	setAttr -s 10 ".koy[0:9]"  0 0 0 0 0 0 0 0 0 0;
createNode animCurveTA -n "CURVE83";
	rename -uid "2262898F-4660-A4E1-5999-739AE5AA62FA";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 10 ".ktv[0:9]"  0 0 12 0 24 0 32 0 40 0 46 0 52 0 58 0 64 0
		 71 -3.3678096837597726e-05;
	setAttr -s 10 ".kit[3:9]"  1 1 18 18 18 18 1;
	setAttr -s 10 ".kot[0:9]"  1 18 18 1 1 18 18 18 
		18 18;
	setAttr -s 10 ".kix[3:9]"  1 1 1 1 1 1 1;
	setAttr -s 10 ".kiy[3:9]"  0 0 0 0 0 0 0;
	setAttr -s 10 ".kox[0:9]"  1 1 1 1 1 1 1 1 1 1;
	setAttr -s 10 ".koy[0:9]"  0 0 0 0 0 0 0 0 0 0;
createNode animCurveTU -n "CURVE84";
	rename -uid "E815CE1F-48D9-DFCA-D385-77A9BF214F6F";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 10 ".ktv[0:9]"  0 1 12 1 24 1 32 1 40 1 46 1 52 1 58 1 64 1
		 71 1;
	setAttr -s 10 ".kit[3:9]"  1 1 18 18 18 18 1;
	setAttr -s 10 ".kot[0:9]"  1 18 18 1 1 18 18 18 
		18 18;
	setAttr -s 10 ".kix[3:9]"  1 1 1 1 1 1 1;
	setAttr -s 10 ".kiy[3:9]"  0 0 0 0 0 0 0;
	setAttr -s 10 ".kox[0:9]"  1 1 1 1 1 1 1 1 1 1;
	setAttr -s 10 ".koy[0:9]"  0 0 0 0 0 0 0 0 0 0;
createNode animCurveTL -n "CURVE86";
	rename -uid "12D71BF8-4E6B-AF59-B27F-379BE7444FC2";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 10 ".ktv[0:9]"  0 0 12 0 24 0 32 0 40 0 46 0 52 0 58 0 64 0
		 71 0;
	setAttr -s 10 ".kit[3:9]"  1 1 18 18 18 18 1;
	setAttr -s 10 ".kot[0:9]"  1 18 18 1 1 18 18 18 
		18 18;
	setAttr -s 10 ".kix[3:9]"  1 1 1 1 1 1 1;
	setAttr -s 10 ".kiy[3:9]"  0 0 0 0 0 0 0;
	setAttr -s 10 ".kox[0:9]"  1 1 1 1 1 1 1 1 1 1;
	setAttr -s 10 ".koy[0:9]"  0 0 0 0 0 0 0 0 0 0;
createNode animCurveTL -n "CURVE87";
	rename -uid "FC74537E-4BCD-DD13-E870-5DBD5A306FE7";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 10 ".ktv[0:9]"  0 0 12 0 24 0 32 0 40 0 46 0 52 0 58 0 64 0
		 71 0;
	setAttr -s 10 ".kit[3:9]"  1 1 18 18 18 18 1;
	setAttr -s 10 ".kot[0:9]"  1 18 18 1 1 18 18 18 
		18 18;
	setAttr -s 10 ".kix[3:9]"  1 1 1 1 1 1 1;
	setAttr -s 10 ".kiy[3:9]"  0 0 0 0 0 0 0;
	setAttr -s 10 ".kox[0:9]"  1 1 1 1 1 1 1 1 1 1;
	setAttr -s 10 ".koy[0:9]"  0 0 0 0 0 0 0 0 0 0;
createNode animCurveTL -n "CURVE88";
	rename -uid "1D80B309-478B-BB85-3BD5-19879D4D1267";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 10 ".ktv[0:9]"  0 0 12 0 24 0 32 0 40 0 46 0 52 0 58 0 64 0
		 71 0;
	setAttr -s 10 ".kit[3:9]"  1 1 18 18 18 18 1;
	setAttr -s 10 ".kot[0:9]"  1 18 18 1 1 18 18 18 
		18 18;
	setAttr -s 10 ".kix[3:9]"  1 1 1 1 1 1 1;
	setAttr -s 10 ".kiy[3:9]"  0 0 0 0 0 0 0;
	setAttr -s 10 ".kox[0:9]"  1 1 1 1 1 1 1 1 1 1;
	setAttr -s 10 ".koy[0:9]"  0 0 0 0 0 0 0 0 0 0;
createNode animCurveTU -n "CURVE89";
	rename -uid "412ED694-4159-45B9-5AAD-AC9EDB9925C3";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 10 ".ktv[0:9]"  0 1 12 1 24 1 32 1 40 1 46 1 52 1 58 1 64 1
		 71 1;
	setAttr -s 10 ".kit[3:9]"  1 1 18 18 18 18 1;
	setAttr -s 10 ".kot[0:9]"  1 18 18 1 1 18 18 18 
		18 18;
	setAttr -s 10 ".kix[3:9]"  1 1 1 1 1 1 1;
	setAttr -s 10 ".kiy[3:9]"  0 0 0 0 0 0 0;
	setAttr -s 10 ".kox[0:9]"  1 1 1 1 1 1 1 1 1 1;
	setAttr -s 10 ".koy[0:9]"  0 0 0 0 0 0 0 0 0 0;
createNode animCurveTU -n "CURVE90";
	rename -uid "B6167AA6-4BB5-364C-36E1-7183DA4A03A2";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 10 ".ktv[0:9]"  0 1 12 1 24 1 32 1 40 1 46 1 52 1 58 1 64 1
		 71 1;
	setAttr -s 10 ".kit[3:9]"  1 1 18 18 18 18 1;
	setAttr -s 10 ".kot[0:9]"  1 18 18 1 1 18 18 18 
		18 18;
	setAttr -s 10 ".kix[3:9]"  1 1 1 1 1 1 1;
	setAttr -s 10 ".kiy[3:9]"  0 0 0 0 0 0 0;
	setAttr -s 10 ".kox[0:9]"  1 1 1 1 1 1 1 1 1 1;
	setAttr -s 10 ".koy[0:9]"  0 0 0 0 0 0 0 0 0 0;
createNode animCurveTU -n "CURVE91";
	rename -uid "A1904C99-408A-A657-410A-3FAC79B53ABE";
	setAttr ".tan" 5;
	setAttr ".wgt" no;
	setAttr -s 10 ".ktv[0:9]"  0 1 12 1 24 1 32 1 40 1 46 1 52 1 58 1 64 1
		 71 1;
	setAttr -s 10 ".kit[0:9]"  9 9 9 1 1 9 9 9 
		9 1;
	setAttr -s 10 ".kix[3:9]"  1 1 1 1 1 1 1;
	setAttr -s 10 ".kiy[3:9]"  0 0 0 0 0 0 0;
createNode animCurveTA -n "CURVE92";
	rename -uid "A5F66683-415D-7D9B-7058-27AA6AA5F54D";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 10 ".ktv[0:9]"  0 0 12 0 24 0 32 0 40 0 46 0 52 0 58 0 64 0
		 71 -4.3543522173551509e-05;
	setAttr -s 10 ".kit[3:9]"  1 1 18 18 18 18 1;
	setAttr -s 10 ".kot[0:9]"  1 18 18 1 1 18 18 18 
		18 18;
	setAttr -s 10 ".kix[3:9]"  1 1 1 1 1 1 1;
	setAttr -s 10 ".kiy[3:9]"  0 0 0 0 0 0 0;
	setAttr -s 10 ".kox[0:9]"  1 1 1 1 1 1 1 1 1 1;
	setAttr -s 10 ".koy[0:9]"  0 0 0 0 0 0 0 0 0 0;
createNode animCurveTA -n "CURVE93";
	rename -uid "75437B7D-4DE9-CBA0-0E2D-C185B07F4E55";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 10 ".ktv[0:9]"  0 0 12 0 24 0 32 0 40 0 46 0 52 0 58 0 64 0
		 71 -5.9153059207225846e-06;
	setAttr -s 10 ".kit[3:9]"  1 1 18 18 18 18 1;
	setAttr -s 10 ".kot[0:9]"  1 18 18 1 1 18 18 18 
		18 18;
	setAttr -s 10 ".kix[3:9]"  1 1 1 1 1 1 1;
	setAttr -s 10 ".kiy[3:9]"  0 0 0 0 0 0 0;
	setAttr -s 10 ".kox[0:9]"  1 1 1 1 1 1 1 1 1 1;
	setAttr -s 10 ".koy[0:9]"  0 0 0 0 0 0 0 0 0 0;
createNode animCurveTA -n "CURVE94";
	rename -uid "2EA1D338-4560-B2C5-CAE6-9F85472D374C";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 10 ".ktv[0:9]"  0 0 12 0 24 0 32 0 40 0 46 0 52 0 58 0 64 0
		 71 4.393540575790831e-05;
	setAttr -s 10 ".kit[3:9]"  1 1 18 18 18 18 1;
	setAttr -s 10 ".kot[0:9]"  1 18 18 1 1 18 18 18 
		18 18;
	setAttr -s 10 ".kix[3:9]"  1 1 1 1 1 1 1;
	setAttr -s 10 ".kiy[3:9]"  0 0 0 0 0 0 0;
	setAttr -s 10 ".kox[0:9]"  1 1 1 1 1 1 1 1 1 1;
	setAttr -s 10 ".koy[0:9]"  0 0 0 0 0 0 0 0 0 0;
createNode animCurveTU -n "CURVE95";
	rename -uid "0D0EA080-404C-58FE-4F0A-E9950FCBD5FB";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 10 ".ktv[0:9]"  0 1 12 1 24 1 32 1 40 1 46 1 52 1 58 1 64 1
		 71 1;
	setAttr -s 10 ".kit[3:9]"  1 1 18 18 18 18 1;
	setAttr -s 10 ".kot[0:9]"  1 18 18 1 1 18 18 18 
		18 18;
	setAttr -s 10 ".kix[3:9]"  1 1 1 1 1 1 1;
	setAttr -s 10 ".kiy[3:9]"  0 0 0 0 0 0 0;
	setAttr -s 10 ".kox[0:9]"  1 1 1 1 1 1 1 1 1 1;
	setAttr -s 10 ".koy[0:9]"  0 0 0 0 0 0 0 0 0 0;
createNode animCurveTL -n "CURVE97";
	rename -uid "6B577432-4C8C-942E-AB93-83AF8AF8352A";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 10 ".ktv[0:9]"  0 0 12 0 24 0 32 0 40 0 46 0 52 0 58 0 64 0
		 71 0;
	setAttr -s 10 ".kit[3:9]"  1 1 18 18 18 18 1;
	setAttr -s 10 ".kot[0:9]"  1 18 18 1 1 18 18 18 
		18 18;
	setAttr -s 10 ".kix[3:9]"  1 1 1 1 1 1 1;
	setAttr -s 10 ".kiy[3:9]"  0 0 0 0 0 0 0;
	setAttr -s 10 ".kox[0:9]"  1 1 1 1 1 1 1 1 1 1;
	setAttr -s 10 ".koy[0:9]"  0 0 0 0 0 0 0 0 0 0;
createNode animCurveTL -n "CURVE98";
	rename -uid "3642E574-472E-6486-0E02-F882C5BFD5A5";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 10 ".ktv[0:9]"  0 0 12 0 24 0 32 0 40 0 46 0 52 0 58 0 64 0
		 71 0;
	setAttr -s 10 ".kit[3:9]"  1 1 18 18 18 18 1;
	setAttr -s 10 ".kot[0:9]"  1 18 18 1 1 18 18 18 
		18 18;
	setAttr -s 10 ".kix[3:9]"  1 1 1 1 1 1 1;
	setAttr -s 10 ".kiy[3:9]"  0 0 0 0 0 0 0;
	setAttr -s 10 ".kox[0:9]"  1 1 1 1 1 1 1 1 1 1;
	setAttr -s 10 ".koy[0:9]"  0 0 0 0 0 0 0 0 0 0;
createNode animCurveTL -n "CURVE99";
	rename -uid "420CF97F-48C4-A392-F54B-B0AB5CC777EF";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 10 ".ktv[0:9]"  0 0 12 0 24 0 32 0 40 0 46 0 52 0 58 0 64 0
		 71 0;
	setAttr -s 10 ".kit[3:9]"  1 1 18 18 18 18 1;
	setAttr -s 10 ".kot[0:9]"  1 18 18 1 1 18 18 18 
		18 18;
	setAttr -s 10 ".kix[3:9]"  1 1 1 1 1 1 1;
	setAttr -s 10 ".kiy[3:9]"  0 0 0 0 0 0 0;
	setAttr -s 10 ".kox[0:9]"  1 1 1 1 1 1 1 1 1 1;
	setAttr -s 10 ".koy[0:9]"  0 0 0 0 0 0 0 0 0 0;
createNode animCurveTU -n "CURVE100";
	rename -uid "44F61A7C-449D-3306-445E-3FBB95F238EE";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 10 ".ktv[0:9]"  0 1 12 1 24 1 32 1 40 1 46 1 52 1 58 1 64 1
		 71 1;
	setAttr -s 10 ".kit[3:9]"  1 1 18 18 18 18 1;
	setAttr -s 10 ".kot[0:9]"  1 18 18 1 1 18 18 18 
		18 18;
	setAttr -s 10 ".kix[3:9]"  1 1 1 1 1 1 1;
	setAttr -s 10 ".kiy[3:9]"  0 0 0 0 0 0 0;
	setAttr -s 10 ".kox[0:9]"  1 1 1 1 1 1 1 1 1 1;
	setAttr -s 10 ".koy[0:9]"  0 0 0 0 0 0 0 0 0 0;
createNode animCurveTU -n "CURVE101";
	rename -uid "49F26AFF-469A-D9DA-3DA3-A482C2FB8CD5";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 10 ".ktv[0:9]"  0 1 12 1 24 1 32 1 40 1 46 1 52 1 58 1 64 1
		 71 1;
	setAttr -s 10 ".kit[3:9]"  1 1 18 18 18 18 1;
	setAttr -s 10 ".kot[0:9]"  1 18 18 1 1 18 18 18 
		18 18;
	setAttr -s 10 ".kix[3:9]"  1 1 1 1 1 1 1;
	setAttr -s 10 ".kiy[3:9]"  0 0 0 0 0 0 0;
	setAttr -s 10 ".kox[0:9]"  1 1 1 1 1 1 1 1 1 1;
	setAttr -s 10 ".koy[0:9]"  0 0 0 0 0 0 0 0 0 0;
createNode animCurveTU -n "CURVE102";
	rename -uid "BF17936B-4F87-B713-6C68-98A32DDEF92A";
	setAttr ".tan" 5;
	setAttr ".wgt" no;
	setAttr -s 10 ".ktv[0:9]"  0 1 12 1 24 1 32 1 40 1 46 1 52 1 58 1 64 1
		 71 1;
	setAttr -s 10 ".kit[0:9]"  9 9 9 1 1 9 9 9 
		9 1;
	setAttr -s 10 ".kix[3:9]"  1 1 1 1 1 1 1;
	setAttr -s 10 ".kiy[3:9]"  0 0 0 0 0 0 0;
createNode animCurveTA -n "CURVE103";
	rename -uid "FDE257BF-491B-F5C7-CA63-BF8EEF80D662";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 10 ".ktv[0:9]"  0 0 12 64.874522139230891 24 64.874522139230891
		 32 0 40 0 46 0 52 0 58 0 64 0 71 0;
	setAttr -s 10 ".kit[3:9]"  1 1 18 18 18 18 1;
	setAttr -s 10 ".kot[0:9]"  1 18 18 1 1 18 18 18 
		18 18;
	setAttr -s 10 ".kix[3:9]"  1 1 1 1 1 1 1;
	setAttr -s 10 ".kiy[3:9]"  0 0 0 0 0 0 0;
	setAttr -s 10 ".kox[0:9]"  1 1 1 1 1 1 1 1 1 1;
	setAttr -s 10 ".koy[0:9]"  0 0 0 0 0 0 0 0 0 0;
createNode animCurveTA -n "CURVE104";
	rename -uid "43CE70BB-4447-5B04-E00C-52A0D53CBF9D";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 10 ".ktv[0:9]"  0 85 12 78.357227990196165 24 78.357227990196165
		 32 85 40 85 46 85 52 85 58 85 64 85 71 90;
	setAttr -s 10 ".kit[3:9]"  1 1 18 18 18 18 1;
	setAttr -s 10 ".kot[0:9]"  1 18 18 1 1 18 18 18 
		18 18;
	setAttr -s 10 ".kix[3:9]"  1 1 1 1 1 1 1;
	setAttr -s 10 ".kiy[3:9]"  0 0 0 0 0 0 0;
	setAttr -s 10 ".kox[0:9]"  1 1 1 1 1 1 1 1 1 1;
	setAttr -s 10 ".koy[0:9]"  0 0 0 0 0 0 0 0 0 0;
createNode animCurveTA -n "CURVE105";
	rename -uid "74A66CBC-4E45-12CD-FB89-3E8810DC7A2A";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 10 ".ktv[0:9]"  0 0 12 25.586430226730435 24 25.586430226730435
		 32 0 40 0 46 59.999999999999993 52 59.999999999999993 58 59.999999999999993 64 59.999999999999993
		 71 0;
	setAttr -s 10 ".kit[3:9]"  1 1 18 18 18 18 1;
	setAttr -s 10 ".kot[0:9]"  1 18 18 1 1 18 18 18 
		18 18;
	setAttr -s 10 ".kix[3:9]"  1 1 1 1 1 1 1;
	setAttr -s 10 ".kiy[3:9]"  0 0 0 0 0 0 0;
	setAttr -s 10 ".kox[0:9]"  1 1 1 1 1 1 1 1 1 1;
	setAttr -s 10 ".koy[0:9]"  0 0 0 0 0 0 0 0 0 0;
createNode animCurveTU -n "CURVE106";
	rename -uid "0720CE3E-412E-047B-6770-52AE2AD33229";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 10 ".ktv[0:9]"  0 1 12 1 24 1 32 1 40 1 46 1 52 1 58 1 64 1
		 71 1;
	setAttr -s 10 ".kit[3:9]"  1 1 18 18 18 18 1;
	setAttr -s 10 ".kot[0:9]"  1 18 18 1 1 18 18 18 
		18 18;
	setAttr -s 10 ".kix[3:9]"  1 1 1 1 1 1 1;
	setAttr -s 10 ".kiy[3:9]"  0 0 0 0 0 0 0;
	setAttr -s 10 ".kox[0:9]"  1 1 1 1 1 1 1 1 1 1;
	setAttr -s 10 ".koy[0:9]"  0 0 0 0 0 0 0 0 0 0;
createNode animCurveTL -n "CURVE108";
	rename -uid "DFB3119E-4DC8-1230-8D03-F2A125757B51";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 10 ".ktv[0:9]"  0 0 12 0 24 0 32 0 40 0 46 0 52 0 58 0 64 0
		 71 0;
	setAttr -s 10 ".kit[3:9]"  1 1 18 18 18 18 1;
	setAttr -s 10 ".kot[0:9]"  1 18 18 1 1 18 18 18 
		18 18;
	setAttr -s 10 ".kix[3:9]"  1 1 1 1 1 1 1;
	setAttr -s 10 ".kiy[3:9]"  0 0 0 0 0 0 0;
	setAttr -s 10 ".kox[0:9]"  1 1 1 1 1 1 1 1 1 1;
	setAttr -s 10 ".koy[0:9]"  0 0 0 0 0 0 0 0 0 0;
createNode animCurveTL -n "CURVE109";
	rename -uid "548A6316-4514-90D0-76D7-1181031E2A12";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 10 ".ktv[0:9]"  0 0 12 0 24 0 32 0 40 0 46 0 52 0 58 0 64 0
		 71 0;
	setAttr -s 10 ".kit[3:9]"  1 1 18 18 18 18 1;
	setAttr -s 10 ".kot[0:9]"  1 18 18 1 1 18 18 18 
		18 18;
	setAttr -s 10 ".kix[3:9]"  1 1 1 1 1 1 1;
	setAttr -s 10 ".kiy[3:9]"  0 0 0 0 0 0 0;
	setAttr -s 10 ".kox[0:9]"  1 1 1 1 1 1 1 1 1 1;
	setAttr -s 10 ".koy[0:9]"  0 0 0 0 0 0 0 0 0 0;
createNode animCurveTL -n "CURVE110";
	rename -uid "A42C4A35-45C7-BE9B-7E29-22A5454666B7";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 10 ".ktv[0:9]"  0 0 12 0 24 0 32 0 40 0 46 0 52 0 58 0 64 0
		 71 0;
	setAttr -s 10 ".kit[3:9]"  1 1 18 18 18 18 1;
	setAttr -s 10 ".kot[0:9]"  1 18 18 1 1 18 18 18 
		18 18;
	setAttr -s 10 ".kix[3:9]"  1 1 1 1 1 1 1;
	setAttr -s 10 ".kiy[3:9]"  0 0 0 0 0 0 0;
	setAttr -s 10 ".kox[0:9]"  1 1 1 1 1 1 1 1 1 1;
	setAttr -s 10 ".koy[0:9]"  0 0 0 0 0 0 0 0 0 0;
createNode animCurveTU -n "CURVE111";
	rename -uid "560479C1-4853-FD1C-BC7F-11BE4D9026CF";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 10 ".ktv[0:9]"  0 1 12 1 24 1 32 1 40 1 46 1 52 1 58 1 64 1
		 71 1;
	setAttr -s 10 ".kit[3:9]"  1 1 18 18 18 18 1;
	setAttr -s 10 ".kot[0:9]"  1 18 18 1 1 18 18 18 
		18 18;
	setAttr -s 10 ".kix[3:9]"  1 1 1 1 1 1 1;
	setAttr -s 10 ".kiy[3:9]"  0 0 0 0 0 0 0;
	setAttr -s 10 ".kox[0:9]"  1 1 1 1 1 1 1 1 1 1;
	setAttr -s 10 ".koy[0:9]"  0 0 0 0 0 0 0 0 0 0;
createNode animCurveTU -n "CURVE112";
	rename -uid "80C71EC7-4D28-56B9-1F0C-44AC310B94B8";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 10 ".ktv[0:9]"  0 1 12 1 24 1 32 1 40 1 46 1 52 1 58 1 64 1
		 71 1;
	setAttr -s 10 ".kit[3:9]"  1 1 18 18 18 18 1;
	setAttr -s 10 ".kot[0:9]"  1 18 18 1 1 18 18 18 
		18 18;
	setAttr -s 10 ".kix[3:9]"  1 1 1 1 1 1 1;
	setAttr -s 10 ".kiy[3:9]"  0 0 0 0 0 0 0;
	setAttr -s 10 ".kox[0:9]"  1 1 1 1 1 1 1 1 1 1;
	setAttr -s 10 ".koy[0:9]"  0 0 0 0 0 0 0 0 0 0;
createNode animCurveTU -n "CURVE113";
	rename -uid "AF7E5295-4008-75D8-FD88-49998C236114";
	setAttr ".tan" 5;
	setAttr ".wgt" no;
	setAttr -s 10 ".ktv[0:9]"  0 1 12 1 24 1 32 1 40 1 46 1 52 1 58 1 64 1
		 71 1;
	setAttr -s 10 ".kit[0:9]"  9 9 9 1 1 9 9 9 
		9 1;
	setAttr -s 10 ".kix[3:9]"  1 1 1 1 1 1 1;
	setAttr -s 10 ".kiy[3:9]"  0 0 0 0 0 0 0;
createNode animCurveTA -n "CURVE114";
	rename -uid "6B5536D5-411A-7990-F6D5-C1BA35CBE0A7";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 10 ".ktv[0:9]"  0 0 12 0 24 0 32 0 40 0 46 0 52 0 58 0 64 0
		 71 -1.2722201487983493e-14;
	setAttr -s 10 ".kit[3:9]"  1 1 18 18 18 18 1;
	setAttr -s 10 ".kot[0:9]"  1 18 18 1 1 18 18 18 
		18 18;
	setAttr -s 10 ".kix[3:9]"  1 1 1 1 1 1 1;
	setAttr -s 10 ".kiy[3:9]"  0 0 0 0 0 0 0;
	setAttr -s 10 ".kox[0:9]"  1 1 1 1 1 1 1 1 1 1;
	setAttr -s 10 ".koy[0:9]"  0 0 0 0 0 0 0 0 0 0;
createNode animCurveTA -n "CURVE115";
	rename -uid "64678055-4E2B-AF04-614B-94BC1707A37B";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 10 ".ktv[0:9]"  0 0 12 0 24 0 32 0 40 0 46 0 52 0 58 0 64 0
		 71 -2.5444446070636118e-14;
	setAttr -s 10 ".kit[3:9]"  1 1 18 18 18 18 1;
	setAttr -s 10 ".kot[0:9]"  1 18 18 1 1 18 18 18 
		18 18;
	setAttr -s 10 ".kix[3:9]"  1 1 1 1 1 1 1;
	setAttr -s 10 ".kiy[3:9]"  0 0 0 0 0 0 0;
	setAttr -s 10 ".kox[0:9]"  1 1 1 1 1 1 1 1 1 1;
	setAttr -s 10 ".koy[0:9]"  0 0 0 0 0 0 0 0 0 0;
createNode animCurveTA -n "CURVE116";
	rename -uid "C9170127-4E1C-51D6-3D23-AC9E54627093";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 10 ".ktv[0:9]"  0 0 12 0 24 0 32 0 40 0 46 0 52 0 58 0 64 0
		 71 7.7632454340761904e-05;
	setAttr -s 10 ".kit[3:9]"  1 1 18 18 18 18 1;
	setAttr -s 10 ".kot[0:9]"  1 18 18 1 1 18 18 18 
		18 18;
	setAttr -s 10 ".kix[3:9]"  1 1 1 1 1 1 1;
	setAttr -s 10 ".kiy[3:9]"  0 0 0 0 0 0 0;
	setAttr -s 10 ".kox[0:9]"  1 1 1 1 1 1 1 1 1 1;
	setAttr -s 10 ".koy[0:9]"  0 0 0 0 0 0 0 0 0 0;
createNode animCurveTU -n "CURVE117";
	rename -uid "2D6C673D-482E-4FB8-E284-5E914486DC49";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 10 ".ktv[0:9]"  0 1 12 1 24 1 32 1 40 1 46 1 52 1 58 1 64 1
		 71 1;
	setAttr -s 10 ".kit[3:9]"  1 1 18 18 18 18 1;
	setAttr -s 10 ".kot[0:9]"  1 18 18 1 1 18 18 18 
		18 18;
	setAttr -s 10 ".kix[3:9]"  1 1 1 1 1 1 1;
	setAttr -s 10 ".kiy[3:9]"  0 0 0 0 0 0 0;
	setAttr -s 10 ".kox[0:9]"  1 1 1 1 1 1 1 1 1 1;
	setAttr -s 10 ".koy[0:9]"  0 0 0 0 0 0 0 0 0 0;
createNode animCurveTL -n "CURVE119";
	rename -uid "7BB21E7B-43C6-0B6B-8D99-ACBBAD13ACD8";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 10 ".ktv[0:9]"  0 0 12 0 24 0 32 0 40 0 46 0 52 0 58 0 64 0
		 71 0;
	setAttr -s 10 ".kit[3:9]"  1 1 18 18 18 18 1;
	setAttr -s 10 ".kot[0:9]"  1 18 18 1 1 18 18 18 
		18 18;
	setAttr -s 10 ".kix[3:9]"  1 1 1 1 1 1 1;
	setAttr -s 10 ".kiy[3:9]"  0 0 0 0 0 0 0;
	setAttr -s 10 ".kox[0:9]"  1 1 1 1 1 1 1 1 1 1;
	setAttr -s 10 ".koy[0:9]"  0 0 0 0 0 0 0 0 0 0;
createNode animCurveTL -n "CURVE120";
	rename -uid "FED36731-4F2F-F9ED-9673-71A868D82CDE";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 10 ".ktv[0:9]"  0 0 12 0 24 0 32 0 40 0 46 0 52 0 58 0 64 0
		 71 0;
	setAttr -s 10 ".kit[3:9]"  1 1 18 18 18 18 1;
	setAttr -s 10 ".kot[0:9]"  1 18 18 1 1 18 18 18 
		18 18;
	setAttr -s 10 ".kix[3:9]"  1 1 1 1 1 1 1;
	setAttr -s 10 ".kiy[3:9]"  0 0 0 0 0 0 0;
	setAttr -s 10 ".kox[0:9]"  1 1 1 1 1 1 1 1 1 1;
	setAttr -s 10 ".koy[0:9]"  0 0 0 0 0 0 0 0 0 0;
createNode animCurveTL -n "CURVE121";
	rename -uid "E09DFFAF-422C-47DB-6184-66A9EE185F75";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 10 ".ktv[0:9]"  0 0 12 0 24 0 32 0 40 0 46 0 52 0 58 0 64 0
		 71 0;
	setAttr -s 10 ".kit[3:9]"  1 1 18 18 18 18 1;
	setAttr -s 10 ".kot[0:9]"  1 18 18 1 1 18 18 18 
		18 18;
	setAttr -s 10 ".kix[3:9]"  1 1 1 1 1 1 1;
	setAttr -s 10 ".kiy[3:9]"  0 0 0 0 0 0 0;
	setAttr -s 10 ".kox[0:9]"  1 1 1 1 1 1 1 1 1 1;
	setAttr -s 10 ".koy[0:9]"  0 0 0 0 0 0 0 0 0 0;
createNode animCurveTU -n "CURVE122";
	rename -uid "8310A221-4B02-B986-39A6-3F929BC7AA33";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 10 ".ktv[0:9]"  0 1 12 1 24 1 32 1 40 1 46 1 52 1 58 1 64 1
		 71 1;
	setAttr -s 10 ".kit[3:9]"  1 1 18 18 18 18 1;
	setAttr -s 10 ".kot[0:9]"  1 18 18 1 1 18 18 18 
		18 18;
	setAttr -s 10 ".kix[3:9]"  1 1 1 1 1 1 1;
	setAttr -s 10 ".kiy[3:9]"  0 0 0 0 0 0 0;
	setAttr -s 10 ".kox[0:9]"  1 1 1 1 1 1 1 1 1 1;
	setAttr -s 10 ".koy[0:9]"  0 0 0 0 0 0 0 0 0 0;
createNode animCurveTU -n "CURVE123";
	rename -uid "8B860875-46D7-F488-69F2-E587EDB99482";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 10 ".ktv[0:9]"  0 1 12 1 24 1 32 1 40 1 46 1 52 1 58 1 64 1
		 71 1;
	setAttr -s 10 ".kit[3:9]"  1 1 18 18 18 18 1;
	setAttr -s 10 ".kot[0:9]"  1 18 18 1 1 18 18 18 
		18 18;
	setAttr -s 10 ".kix[3:9]"  1 1 1 1 1 1 1;
	setAttr -s 10 ".kiy[3:9]"  0 0 0 0 0 0 0;
	setAttr -s 10 ".kox[0:9]"  1 1 1 1 1 1 1 1 1 1;
	setAttr -s 10 ".koy[0:9]"  0 0 0 0 0 0 0 0 0 0;
createNode animCurveTU -n "CURVE124";
	rename -uid "61708F40-455C-B251-525A-2F948CC5A5B5";
	setAttr ".tan" 5;
	setAttr ".wgt" no;
	setAttr -s 10 ".ktv[0:9]"  0 1 12 1 24 1 32 1 40 1 46 1 52 1 58 1 64 1
		 71 1;
	setAttr -s 10 ".kit[0:9]"  9 9 9 1 1 9 9 9 
		9 1;
	setAttr -s 10 ".kix[3:9]"  1 1 1 1 1 1 1;
	setAttr -s 10 ".kiy[3:9]"  0 0 0 0 0 0 0;
createNode animCurveTA -n "CURVE125";
	rename -uid "45965F5E-45AF-E296-6860-1793FBB6F051";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 10 ".ktv[0:9]"  0 0 12 0 24 0 32 0 40 0 46 0 52 0 58 0 64 0
		 71 0;
	setAttr -s 10 ".kit[3:9]"  1 1 18 18 18 18 1;
	setAttr -s 10 ".kot[0:9]"  1 18 18 1 1 18 18 18 
		18 18;
	setAttr -s 10 ".kix[3:9]"  1 1 1 1 1 1 1;
	setAttr -s 10 ".kiy[3:9]"  0 0 0 0 0 0 0;
	setAttr -s 10 ".kox[0:9]"  1 1 1 1 1 1 1 1 1 1;
	setAttr -s 10 ".koy[0:9]"  0 0 0 0 0 0 0 0 0 0;
createNode animCurveTA -n "CURVE126";
	rename -uid "2D4CDD27-4EE3-DFAA-6EAF-38984B78A1B5";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 10 ".ktv[0:9]"  0 85 12 85 24 85 32 85 40 85 46 90 52 90
		 58 90 64 90 71 90;
	setAttr -s 10 ".kit[3:9]"  1 1 18 18 18 18 1;
	setAttr -s 10 ".kot[0:9]"  1 18 18 1 1 18 18 18 
		18 18;
	setAttr -s 10 ".kix[3:9]"  1 1 1 1 1 1 1;
	setAttr -s 10 ".kiy[3:9]"  0 0 0 0 0 0 0;
	setAttr -s 10 ".kox[0:9]"  1 1 1 1 1 1 1 1 1 1;
	setAttr -s 10 ".koy[0:9]"  0 0 0 0 0 0 0 0 0 0;
createNode animCurveTA -n "CURVE127";
	rename -uid "3847FD81-4835-A9D7-99BD-DFA7E054EC9C";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 10 ".ktv[0:9]"  0 0 12 0 24 0 32 0 40 0 46 0 52 0 58 0 64 0
		 71 0;
	setAttr -s 10 ".kit[3:9]"  1 1 18 18 18 18 1;
	setAttr -s 10 ".kot[0:9]"  1 18 18 1 1 18 18 18 
		18 18;
	setAttr -s 10 ".kix[3:9]"  1 1 1 1 1 1 1;
	setAttr -s 10 ".kiy[3:9]"  0 0 0 0 0 0 0;
	setAttr -s 10 ".kox[0:9]"  1 1 1 1 1 1 1 1 1 1;
	setAttr -s 10 ".koy[0:9]"  0 0 0 0 0 0 0 0 0 0;
createNode animCurveTU -n "CURVE128";
	rename -uid "B4CF27D0-47C5-7BBC-F184-F7BD0FF932C4";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 10 ".ktv[0:9]"  0 1 12 1 24 1 32 1 40 1 46 1 52 1 58 1 64 1
		 71 1;
	setAttr -s 10 ".kit[3:9]"  1 1 18 18 18 18 1;
	setAttr -s 10 ".kot[0:9]"  1 18 18 1 1 18 18 18 
		18 18;
	setAttr -s 10 ".kix[3:9]"  1 1 1 1 1 1 1;
	setAttr -s 10 ".kiy[3:9]"  0 0 0 0 0 0 0;
	setAttr -s 10 ".kox[0:9]"  1 1 1 1 1 1 1 1 1 1;
	setAttr -s 10 ".koy[0:9]"  0 0 0 0 0 0 0 0 0 0;
createNode animCurveTU -n "CURVE130";
	rename -uid "90DA277A-400B-83D2-80C9-F2AB539E34FA";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 10 ".ktv[0:9]"  0 1 12 9 24 9 32 1 40 1 46 9 52 9 58 9 64 9
		 71 2;
	setAttr -s 10 ".kit[3:9]"  1 1 18 18 18 18 1;
	setAttr -s 10 ".kot[0:9]"  1 18 18 1 1 18 18 18 
		18 18;
	setAttr -s 10 ".kix[3:9]"  1 1 1 1 1 1 1;
	setAttr -s 10 ".kiy[3:9]"  0 0 0 0 0 0 0;
	setAttr -s 10 ".kox[0:9]"  0.064679100035391665 1 1 1 1 1 1 1 1 1;
	setAttr -s 10 ".koy[0:9]"  0.99790611483175695 0 0 0 0 0 0 0 0 0;
createNode animCurveTU -n "CURVE131";
	rename -uid "4C5CC414-465F-7EDA-FE8E-B483AE4F1544";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 10 ".ktv[0:9]"  0 0 12 0 24 0 32 0 40 0 46 0 52 0 58 0 64 0
		 71 0;
	setAttr -s 10 ".kit[3:9]"  1 1 18 18 18 18 1;
	setAttr -s 10 ".kot[0:9]"  1 18 18 1 1 18 18 18 
		18 18;
	setAttr -s 10 ".kix[3:9]"  1 1 1 1 1 1 1;
	setAttr -s 10 ".kiy[3:9]"  0 0 0 0 0 0 0;
	setAttr -s 10 ".kox[0:9]"  1 1 1 1 1 1 1 1 1 1;
	setAttr -s 10 ".koy[0:9]"  0 0 0 0 0 0 0 0 0 0;
createNode animCurveTU -n "CURVE132";
	rename -uid "6005788C-4F5E-7E9C-7751-179D0B83E7E9";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 10 ".ktv[0:9]"  0 1 12 0 24 0 32 1 40 1 46 0 52 0 58 0 64 0
		 71 2;
	setAttr -s 10 ".kit[3:9]"  1 1 18 18 18 18 1;
	setAttr -s 10 ".kot[0:9]"  1 18 18 1 1 18 18 18 
		18 18;
	setAttr -s 10 ".kix[3:9]"  1 1 1 1 1 1 1;
	setAttr -s 10 ".kiy[3:9]"  0 0 0 0 0 0 0;
	setAttr -s 10 ".kox[0:9]"  1 1 1 1 1 1 1 1 1 1;
	setAttr -s 10 ".koy[0:9]"  0 0 0 0 0 0 0 0 0 0;
createNode animCurveTU -n "CURVE133";
	rename -uid "D59AA653-428C-B9EE-694F-A282991125ED";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 10 ".ktv[0:9]"  0 0 12 0 24 0 32 0 40 0 46 0 52 0 58 0 64 0
		 71 0;
	setAttr -s 10 ".kit[3:9]"  1 1 18 18 18 18 1;
	setAttr -s 10 ".kot[0:9]"  1 18 18 1 1 18 18 18 
		18 18;
	setAttr -s 10 ".kix[3:9]"  1 1 1 1 1 1 1;
	setAttr -s 10 ".kiy[3:9]"  0 0 0 0 0 0 0;
	setAttr -s 10 ".kox[0:9]"  1 1 1 1 1 1 1 1 1 1;
	setAttr -s 10 ".koy[0:9]"  0 0 0 0 0 0 0 0 0 0;
createNode animCurveTU -n "CURVE134";
	rename -uid "C9F4FCD7-40EA-FC8E-3527-13A0FEB1E183";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 10 ".ktv[0:9]"  0 1 12 9 24 9 32 1 40 1 46 9 52 9 58 9 64 9
		 71 2;
	setAttr -s 10 ".kit[3:9]"  1 1 18 18 18 18 1;
	setAttr -s 10 ".kot[0:9]"  1 18 18 1 1 18 18 18 
		18 18;
	setAttr -s 10 ".kix[3:9]"  1 1 1 1 1 1 1;
	setAttr -s 10 ".kiy[3:9]"  0 0 0 0 0 0 0;
	setAttr -s 10 ".kox[0:9]"  0.064679100035391665 1 1 1 1 1 1 1 1 1;
	setAttr -s 10 ".koy[0:9]"  0.99790611483175695 0 0 0 0 0 0 0 0 0;
createNode animCurveTU -n "CURVE135";
	rename -uid "7B252487-485A-F7BA-561D-C5A05D5558BB";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 10 ".ktv[0:9]"  0 1 12 9 24 9 32 1 40 1 46 9 52 9 58 9 64 9
		 71 2;
	setAttr -s 10 ".kit[3:9]"  1 1 18 18 18 18 1;
	setAttr -s 10 ".kot[0:9]"  1 18 18 1 1 18 18 18 
		18 18;
	setAttr -s 10 ".kix[3:9]"  1 1 1 1 1 1 1;
	setAttr -s 10 ".kiy[3:9]"  0 0 0 0 0 0 0;
	setAttr -s 10 ".kox[0:9]"  0.064679100035391665 1 1 1 1 1 1 1 1 1;
	setAttr -s 10 ".koy[0:9]"  0.99790611483175695 0 0 0 0 0 0 0 0 0;
createNode animCurveTU -n "CURVE136";
	rename -uid "A015FE2D-4711-FE69-79F2-7AA8A372E7C1";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 10 ".ktv[0:9]"  0 1 12 9 24 9 32 1 40 1 46 9 52 9 58 9 64 9
		 71 2;
	setAttr -s 10 ".kit[3:9]"  1 1 18 18 18 18 1;
	setAttr -s 10 ".kot[0:9]"  1 18 18 1 1 18 18 18 
		18 18;
	setAttr -s 10 ".kix[3:9]"  1 1 1 1 1 1 1;
	setAttr -s 10 ".kiy[3:9]"  0 0 0 0 0 0 0;
	setAttr -s 10 ".kox[0:9]"  0.064679100035391665 1 1 1 1 1 1 1 1 1;
	setAttr -s 10 ".koy[0:9]"  0.99790611483175695 0 0 0 0 0 0 0 0 0;
createNode animCurveTL -n "CURVE138";
	rename -uid "B81E3A81-4578-F3A4-C4D3-80AAF6AD16ED";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 10 ".ktv[0:9]"  0 0 12 0 24 0 32 0 40 0 46 0 52 0 58 0 64 0
		 71 0;
	setAttr -s 10 ".kit[3:9]"  1 1 18 18 18 18 1;
	setAttr -s 10 ".kot[0:9]"  1 18 18 1 1 18 18 18 
		18 18;
	setAttr -s 10 ".kix[3:9]"  1 1 1 1 1 1 1;
	setAttr -s 10 ".kiy[3:9]"  0 0 0 0 0 0 0;
	setAttr -s 10 ".kox[0:9]"  1 1 1 1 1 1 1 1 1 1;
	setAttr -s 10 ".koy[0:9]"  0 0 0 0 0 0 0 0 0 0;
createNode animCurveTL -n "CURVE139";
	rename -uid "141CBC90-4F12-4B4E-86BB-2DABD9E0722E";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 10 ".ktv[0:9]"  0 0 12 0 24 0 32 0 40 0 46 0 52 0 58 0 64 0
		 71 0;
	setAttr -s 10 ".kit[3:9]"  1 1 18 18 18 18 1;
	setAttr -s 10 ".kot[0:9]"  1 18 18 1 1 18 18 18 
		18 18;
	setAttr -s 10 ".kix[3:9]"  1 1 1 1 1 1 1;
	setAttr -s 10 ".kiy[3:9]"  0 0 0 0 0 0 0;
	setAttr -s 10 ".kox[0:9]"  1 1 1 1 1 1 1 1 1 1;
	setAttr -s 10 ".koy[0:9]"  0 0 0 0 0 0 0 0 0 0;
createNode animCurveTL -n "CURVE140";
	rename -uid "587FC712-4A81-5AC5-E5BF-CE8931EA5C1A";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 10 ".ktv[0:9]"  0 0 12 0 24 0 32 0 40 0 46 0 52 0 58 0 64 0
		 71 0;
	setAttr -s 10 ".kit[3:9]"  1 1 18 18 18 18 1;
	setAttr -s 10 ".kot[0:9]"  1 18 18 1 1 18 18 18 
		18 18;
	setAttr -s 10 ".kix[3:9]"  1 1 1 1 1 1 1;
	setAttr -s 10 ".kiy[3:9]"  0 0 0 0 0 0 0;
	setAttr -s 10 ".kox[0:9]"  1 1 1 1 1 1 1 1 1 1;
	setAttr -s 10 ".koy[0:9]"  0 0 0 0 0 0 0 0 0 0;
createNode animCurveTU -n "CURVE141";
	rename -uid "FC89F5B8-473B-1F7F-6453-4A8D8E6AC9A3";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 10 ".ktv[0:9]"  0 1 12 1 24 1 32 1 40 1 46 1 52 1 58 1 64 1
		 71 1;
	setAttr -s 10 ".kit[3:9]"  1 1 18 18 18 18 1;
	setAttr -s 10 ".kot[0:9]"  1 18 18 1 1 18 18 18 
		18 18;
	setAttr -s 10 ".kix[3:9]"  1 1 1 1 1 1 1;
	setAttr -s 10 ".kiy[3:9]"  0 0 0 0 0 0 0;
	setAttr -s 10 ".kox[0:9]"  1 1 1 1 1 1 1 1 1 1;
	setAttr -s 10 ".koy[0:9]"  0 0 0 0 0 0 0 0 0 0;
createNode animCurveTU -n "CURVE142";
	rename -uid "6DBB77C9-4294-CE19-4B8A-53BDAB9CC89E";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 10 ".ktv[0:9]"  0 1 12 1 24 1 32 1 40 1 46 1 52 1 58 1 64 1
		 71 1;
	setAttr -s 10 ".kit[3:9]"  1 1 18 18 18 18 1;
	setAttr -s 10 ".kot[0:9]"  1 18 18 1 1 18 18 18 
		18 18;
	setAttr -s 10 ".kix[3:9]"  1 1 1 1 1 1 1;
	setAttr -s 10 ".kiy[3:9]"  0 0 0 0 0 0 0;
	setAttr -s 10 ".kox[0:9]"  1 1 1 1 1 1 1 1 1 1;
	setAttr -s 10 ".koy[0:9]"  0 0 0 0 0 0 0 0 0 0;
createNode animCurveTU -n "CURVE143";
	rename -uid "763B834D-4C38-D8DA-3A87-739B6EB82D1C";
	setAttr ".tan" 5;
	setAttr ".wgt" no;
	setAttr -s 10 ".ktv[0:9]"  0 1 12 1 24 1 32 1 40 1 46 1 52 1 58 1 64 1
		 71 1;
	setAttr -s 10 ".kit[0:9]"  9 9 9 1 1 9 9 9 
		9 1;
	setAttr -s 10 ".kix[3:9]"  1 1 1 1 1 1 1;
	setAttr -s 10 ".kiy[3:9]"  0 0 0 0 0 0 0;
createNode animCurveTA -n "CURVE144";
	rename -uid "5BC454EF-467E-071D-34A1-218728B8EABA";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 10 ".ktv[0:9]"  0 0 12 0 24 0 32 0 40 0 46 0 52 0 58 0 64 0
		 71 3.3080203597826071e-11;
	setAttr -s 10 ".kit[3:9]"  1 1 18 18 18 18 1;
	setAttr -s 10 ".kot[0:9]"  1 18 18 1 1 18 18 18 
		18 18;
	setAttr -s 10 ".kix[3:9]"  1 1 1 1 1 1 1;
	setAttr -s 10 ".kiy[3:9]"  0 0 0 0 0 0 0;
	setAttr -s 10 ".kox[0:9]"  1 1 1 1 1 1 1 1 1 1;
	setAttr -s 10 ".koy[0:9]"  0 0 0 0 0 0 0 0 0 0;
createNode animCurveTA -n "CURVE145";
	rename -uid "166EC157-4C09-3EEE-35D8-3BAE60A8E0A4";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 10 ".ktv[0:9]"  0 0 12 0 24 0 32 0 40 0 46 0 52 0 58 0 64 0
		 71 4.503318528081312e-05;
	setAttr -s 10 ".kit[3:9]"  1 1 18 18 18 18 1;
	setAttr -s 10 ".kot[0:9]"  1 18 18 1 1 18 18 18 
		18 18;
	setAttr -s 10 ".kix[3:9]"  1 1 1 1 1 1 1;
	setAttr -s 10 ".kiy[3:9]"  0 0 0 0 0 0 0;
	setAttr -s 10 ".kox[0:9]"  1 1 1 1 1 1 1 1 1 1;
	setAttr -s 10 ".koy[0:9]"  0 0 0 0 0 0 0 0 0 0;
createNode animCurveTA -n "CURVE146";
	rename -uid "D25638E6-411B-AA33-BA7F-359ADA9F48AC";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 10 ".ktv[0:9]"  0 0 12 0 24 0 32 0 40 0 46 0 52 0 58 0 64 0
		 71 -4.3410282856535862e-05;
	setAttr -s 10 ".kit[3:9]"  1 1 18 18 18 18 1;
	setAttr -s 10 ".kot[0:9]"  1 18 18 1 1 18 18 18 
		18 18;
	setAttr -s 10 ".kix[3:9]"  1 1 1 1 1 1 1;
	setAttr -s 10 ".kiy[3:9]"  0 0 0 0 0 0 0;
	setAttr -s 10 ".kox[0:9]"  1 1 1 1 1 1 1 1 1 1;
	setAttr -s 10 ".koy[0:9]"  0 0 0 0 0 0 0 0 0 0;
createNode animCurveTU -n "CURVE147";
	rename -uid "37CFC2C1-4345-B730-C8C9-749660CDED67";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 10 ".ktv[0:9]"  0 1 12 1 24 1 32 1 40 1 46 1 52 1 58 1 64 1
		 71 1;
	setAttr -s 10 ".kit[3:9]"  1 1 18 18 18 18 1;
	setAttr -s 10 ".kot[0:9]"  1 18 18 1 1 18 18 18 
		18 18;
	setAttr -s 10 ".kix[3:9]"  1 1 1 1 1 1 1;
	setAttr -s 10 ".kiy[3:9]"  0 0 0 0 0 0 0;
	setAttr -s 10 ".kox[0:9]"  1 1 1 1 1 1 1 1 1 1;
	setAttr -s 10 ".koy[0:9]"  0 0 0 0 0 0 0 0 0 0;
createNode animCurveTL -n "CURVE149";
	rename -uid "EE0C9016-4EBD-B93D-154C-EA93A60CE326";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 10 ".ktv[0:9]"  0 0 12 0 24 0 32 0 40 0 46 0 52 0 58 0 64 0
		 71 0;
	setAttr -s 10 ".kit[3:9]"  1 1 18 18 18 18 1;
	setAttr -s 10 ".kot[0:9]"  1 18 18 1 1 18 18 18 
		18 18;
	setAttr -s 10 ".kix[3:9]"  1 1 1 1 1 1 1;
	setAttr -s 10 ".kiy[3:9]"  0 0 0 0 0 0 0;
	setAttr -s 10 ".kox[0:9]"  1 1 1 1 1 1 1 1 1 1;
	setAttr -s 10 ".koy[0:9]"  0 0 0 0 0 0 0 0 0 0;
createNode animCurveTL -n "CURVE150";
	rename -uid "31283212-4CE9-6D07-FD1B-9F8A2C72CC96";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 10 ".ktv[0:9]"  0 0 12 0 24 0 32 0 40 0 46 0 52 0 58 0 64 0
		 71 0;
	setAttr -s 10 ".kit[3:9]"  1 1 18 18 18 18 1;
	setAttr -s 10 ".kot[0:9]"  1 18 18 1 1 18 18 18 
		18 18;
	setAttr -s 10 ".kix[3:9]"  1 1 1 1 1 1 1;
	setAttr -s 10 ".kiy[3:9]"  0 0 0 0 0 0 0;
	setAttr -s 10 ".kox[0:9]"  1 1 1 1 1 1 1 1 1 1;
	setAttr -s 10 ".koy[0:9]"  0 0 0 0 0 0 0 0 0 0;
createNode animCurveTL -n "CURVE151";
	rename -uid "F321BEDC-4B2D-A47C-2596-8B9D0971000E";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 10 ".ktv[0:9]"  0 0 12 0 24 0 32 0 40 0 46 0 52 0 58 0 64 0
		 71 0;
	setAttr -s 10 ".kit[3:9]"  1 1 18 18 18 18 1;
	setAttr -s 10 ".kot[0:9]"  1 18 18 1 1 18 18 18 
		18 18;
	setAttr -s 10 ".kix[3:9]"  1 1 1 1 1 1 1;
	setAttr -s 10 ".kiy[3:9]"  0 0 0 0 0 0 0;
	setAttr -s 10 ".kox[0:9]"  1 1 1 1 1 1 1 1 1 1;
	setAttr -s 10 ".koy[0:9]"  0 0 0 0 0 0 0 0 0 0;
createNode animCurveTU -n "CURVE152";
	rename -uid "5C473BDC-4217-6535-7B96-1CA7D4F0A058";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 10 ".ktv[0:9]"  0 1 12 1 24 1 32 1 40 1 46 1 52 1 58 1 64 1
		 71 1;
	setAttr -s 10 ".kit[3:9]"  1 1 18 18 18 18 1;
	setAttr -s 10 ".kot[0:9]"  1 18 18 1 1 18 18 18 
		18 18;
	setAttr -s 10 ".kix[3:9]"  1 1 1 1 1 1 1;
	setAttr -s 10 ".kiy[3:9]"  0 0 0 0 0 0 0;
	setAttr -s 10 ".kox[0:9]"  1 1 1 1 1 1 1 1 1 1;
	setAttr -s 10 ".koy[0:9]"  0 0 0 0 0 0 0 0 0 0;
createNode animCurveTU -n "CURVE153";
	rename -uid "AA6E6FA9-41D0-28BC-5855-449B3068B5BE";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 10 ".ktv[0:9]"  0 1 12 1 24 1 32 1 40 1 46 1 52 1 58 1 64 1
		 71 1;
	setAttr -s 10 ".kit[3:9]"  1 1 18 18 18 18 1;
	setAttr -s 10 ".kot[0:9]"  1 18 18 1 1 18 18 18 
		18 18;
	setAttr -s 10 ".kix[3:9]"  1 1 1 1 1 1 1;
	setAttr -s 10 ".kiy[3:9]"  0 0 0 0 0 0 0;
	setAttr -s 10 ".kox[0:9]"  1 1 1 1 1 1 1 1 1 1;
	setAttr -s 10 ".koy[0:9]"  0 0 0 0 0 0 0 0 0 0;
createNode animCurveTU -n "CURVE154";
	rename -uid "D7775BE3-489B-8A95-35F0-B4BABDC1F07C";
	setAttr ".tan" 5;
	setAttr ".wgt" no;
	setAttr -s 10 ".ktv[0:9]"  0 1 12 1 24 1 32 1 40 1 46 1 52 1 58 1 64 1
		 71 1;
	setAttr -s 10 ".kit[0:9]"  9 9 9 1 1 9 9 9 
		9 1;
	setAttr -s 10 ".kix[3:9]"  1 1 1 1 1 1 1;
	setAttr -s 10 ".kiy[3:9]"  0 0 0 0 0 0 0;
createNode animCurveTA -n "CURVE155";
	rename -uid "CB8E789E-4739-ACB5-907B-B38EC511012B";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 10 ".ktv[0:9]"  0 0 12 0 24 0 32 0 40 0 46 0 52 0 58 0 64 0
		 71 0;
	setAttr -s 10 ".kit[3:9]"  1 1 18 18 18 18 1;
	setAttr -s 10 ".kot[0:9]"  1 18 18 1 1 18 18 18 
		18 18;
	setAttr -s 10 ".kix[3:9]"  1 1 1 1 1 1 1;
	setAttr -s 10 ".kiy[3:9]"  0 0 0 0 0 0 0;
	setAttr -s 10 ".kox[0:9]"  1 1 1 1 1 1 1 1 1 1;
	setAttr -s 10 ".koy[0:9]"  0 0 0 0 0 0 0 0 0 0;
createNode animCurveTA -n "CURVE156";
	rename -uid "35B5DEED-4168-11C1-6BE8-21AB97907999";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 10 ".ktv[0:9]"  0 0 12 0 24 0 32 0 40 0 46 0 52 0 58 0 64 0
		 71 0;
	setAttr -s 10 ".kit[3:9]"  1 1 18 18 18 18 1;
	setAttr -s 10 ".kot[0:9]"  1 18 18 1 1 18 18 18 
		18 18;
	setAttr -s 10 ".kix[3:9]"  1 1 1 1 1 1 1;
	setAttr -s 10 ".kiy[3:9]"  0 0 0 0 0 0 0;
	setAttr -s 10 ".kox[0:9]"  1 1 1 1 1 1 1 1 1 1;
	setAttr -s 10 ".koy[0:9]"  0 0 0 0 0 0 0 0 0 0;
createNode animCurveTA -n "CURVE157";
	rename -uid "9520510A-4299-576B-A1BE-CD8B40254FD8";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 10 ".ktv[0:9]"  0 0 12 0 24 0 32 0 40 0 46 0 52 0 58 0 64 0
		 71 -3.3656445873159016e-05;
	setAttr -s 10 ".kit[3:9]"  1 1 18 18 18 18 1;
	setAttr -s 10 ".kot[0:9]"  1 18 18 1 1 18 18 18 
		18 18;
	setAttr -s 10 ".kix[3:9]"  1 1 1 1 1 1 1;
	setAttr -s 10 ".kiy[3:9]"  0 0 0 0 0 0 0;
	setAttr -s 10 ".kox[0:9]"  1 1 1 1 1 1 1 1 1 1;
	setAttr -s 10 ".koy[0:9]"  0 0 0 0 0 0 0 0 0 0;
createNode animCurveTU -n "CURVE158";
	rename -uid "598BE7F0-4881-C912-9D97-329B1E1BFDFA";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 10 ".ktv[0:9]"  0 1 12 1 24 1 32 1 40 1 46 1 52 1 58 1 64 1
		 71 1;
	setAttr -s 10 ".kit[3:9]"  1 1 18 18 18 18 1;
	setAttr -s 10 ".kot[0:9]"  1 18 18 1 1 18 18 18 
		18 18;
	setAttr -s 10 ".kix[3:9]"  1 1 1 1 1 1 1;
	setAttr -s 10 ".kiy[3:9]"  0 0 0 0 0 0 0;
	setAttr -s 10 ".kox[0:9]"  1 1 1 1 1 1 1 1 1 1;
	setAttr -s 10 ".koy[0:9]"  0 0 0 0 0 0 0 0 0 0;
createNode animCurveTL -n "CURVE160";
	rename -uid "4A74280F-4D5B-CE08-6DC2-7C84B0A46426";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 10 ".ktv[0:9]"  0 0 12 0 24 0 32 0 40 0 46 0 52 0 58 0 64 0
		 71 0;
	setAttr -s 10 ".kit[3:9]"  1 1 18 18 18 18 1;
	setAttr -s 10 ".kot[0:9]"  1 18 18 1 1 18 18 18 
		18 18;
	setAttr -s 10 ".kix[3:9]"  1 1 1 1 1 1 1;
	setAttr -s 10 ".kiy[3:9]"  0 0 0 0 0 0 0;
	setAttr -s 10 ".kox[0:9]"  1 1 1 1 1 1 1 1 1 1;
	setAttr -s 10 ".koy[0:9]"  0 0 0 0 0 0 0 0 0 0;
createNode animCurveTL -n "CURVE161";
	rename -uid "1F44A55C-41AE-B632-0554-B3B625877621";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 10 ".ktv[0:9]"  0 0 12 0 24 0 32 0 40 0 46 0 52 0 58 0 64 0
		 71 0;
	setAttr -s 10 ".kit[3:9]"  1 1 18 18 18 18 1;
	setAttr -s 10 ".kot[0:9]"  1 18 18 1 1 18 18 18 
		18 18;
	setAttr -s 10 ".kix[3:9]"  1 1 1 1 1 1 1;
	setAttr -s 10 ".kiy[3:9]"  0 0 0 0 0 0 0;
	setAttr -s 10 ".kox[0:9]"  1 1 1 1 1 1 1 1 1 1;
	setAttr -s 10 ".koy[0:9]"  0 0 0 0 0 0 0 0 0 0;
createNode animCurveTL -n "CURVE162";
	rename -uid "00B64C4F-482D-55E4-268E-818243EE26DA";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 10 ".ktv[0:9]"  0 0 12 0 24 0 32 0 40 0 46 0 52 0 58 0 64 0
		 71 0;
	setAttr -s 10 ".kit[3:9]"  1 1 18 18 18 18 1;
	setAttr -s 10 ".kot[0:9]"  1 18 18 1 1 18 18 18 
		18 18;
	setAttr -s 10 ".kix[3:9]"  1 1 1 1 1 1 1;
	setAttr -s 10 ".kiy[3:9]"  0 0 0 0 0 0 0;
	setAttr -s 10 ".kox[0:9]"  1 1 1 1 1 1 1 1 1 1;
	setAttr -s 10 ".koy[0:9]"  0 0 0 0 0 0 0 0 0 0;
createNode animCurveTU -n "CURVE163";
	rename -uid "C1164602-4268-5907-4EB9-588CD1617AA5";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 10 ".ktv[0:9]"  0 1 12 1 24 1 32 1 40 1 46 1 52 1 58 1 64 1
		 71 1;
	setAttr -s 10 ".kit[3:9]"  1 1 18 18 18 18 1;
	setAttr -s 10 ".kot[0:9]"  1 18 18 1 1 18 18 18 
		18 18;
	setAttr -s 10 ".kix[3:9]"  1 1 1 1 1 1 1;
	setAttr -s 10 ".kiy[3:9]"  0 0 0 0 0 0 0;
	setAttr -s 10 ".kox[0:9]"  1 1 1 1 1 1 1 1 1 1;
	setAttr -s 10 ".koy[0:9]"  0 0 0 0 0 0 0 0 0 0;
createNode animCurveTU -n "CURVE164";
	rename -uid "5FB5B1C4-433F-7B8D-D693-B3936F1A491D";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 10 ".ktv[0:9]"  0 1 12 1 24 1 32 1 40 1 46 1 52 1 58 1 64 1
		 71 1;
	setAttr -s 10 ".kit[3:9]"  1 1 18 18 18 18 1;
	setAttr -s 10 ".kot[0:9]"  1 18 18 1 1 18 18 18 
		18 18;
	setAttr -s 10 ".kix[3:9]"  1 1 1 1 1 1 1;
	setAttr -s 10 ".kiy[3:9]"  0 0 0 0 0 0 0;
	setAttr -s 10 ".kox[0:9]"  1 1 1 1 1 1 1 1 1 1;
	setAttr -s 10 ".koy[0:9]"  0 0 0 0 0 0 0 0 0 0;
createNode animCurveTU -n "CURVE165";
	rename -uid "980442B4-4EBE-0539-B402-A5BECC620C21";
	setAttr ".tan" 5;
	setAttr ".wgt" no;
	setAttr -s 10 ".ktv[0:9]"  0 1 12 1 24 1 32 1 40 1 46 1 52 1 58 1 64 1
		 71 1;
	setAttr -s 10 ".kit[0:9]"  9 9 9 1 1 9 9 9 
		9 1;
	setAttr -s 10 ".kix[3:9]"  1 1 1 1 1 1 1;
	setAttr -s 10 ".kiy[3:9]"  0 0 0 0 0 0 0;
createNode animCurveTA -n "CURVE166";
	rename -uid "583ECB8E-44FA-87A5-5252-E1AB3653784E";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 10 ".ktv[0:9]"  0 0 12 0 24 0 32 0 40 0 46 0 52 0 58 0 64 0
		 71 0;
	setAttr -s 10 ".kit[3:9]"  1 1 18 18 18 18 1;
	setAttr -s 10 ".kot[0:9]"  1 18 18 1 1 18 18 18 
		18 18;
	setAttr -s 10 ".kix[3:9]"  1 1 1 1 1 1 1;
	setAttr -s 10 ".kiy[3:9]"  0 0 0 0 0 0 0;
	setAttr -s 10 ".kox[0:9]"  1 1 1 1 1 1 1 1 1 1;
	setAttr -s 10 ".koy[0:9]"  0 0 0 0 0 0 0 0 0 0;
createNode animCurveTA -n "CURVE167";
	rename -uid "E9E73C30-4A8F-5F2C-1594-78BE46CD58E4";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 10 ".ktv[0:9]"  0 0 12 0 24 0 32 0 40 0 46 0 52 0 58 0 64 0
		 71 0;
	setAttr -s 10 ".kit[3:9]"  1 1 18 18 18 18 1;
	setAttr -s 10 ".kot[0:9]"  1 18 18 1 1 18 18 18 
		18 18;
	setAttr -s 10 ".kix[3:9]"  1 1 1 1 1 1 1;
	setAttr -s 10 ".kiy[3:9]"  0 0 0 0 0 0 0;
	setAttr -s 10 ".kox[0:9]"  1 1 1 1 1 1 1 1 1 1;
	setAttr -s 10 ".koy[0:9]"  0 0 0 0 0 0 0 0 0 0;
createNode animCurveTA -n "CURVE168";
	rename -uid "7632075D-49AA-874B-2643-E18ED61F0618";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 10 ".ktv[0:9]"  0 0 12 0 24 0 32 0 40 0 46 0 52 0 58 0 64 0
		 71 0;
	setAttr -s 10 ".kit[3:9]"  1 1 18 18 18 18 1;
	setAttr -s 10 ".kot[0:9]"  1 18 18 1 1 18 18 18 
		18 18;
	setAttr -s 10 ".kix[3:9]"  1 1 1 1 1 1 1;
	setAttr -s 10 ".kiy[3:9]"  0 0 0 0 0 0 0;
	setAttr -s 10 ".kox[0:9]"  1 1 1 1 1 1 1 1 1 1;
	setAttr -s 10 ".koy[0:9]"  0 0 0 0 0 0 0 0 0 0;
createNode animCurveTU -n "CURVE169";
	rename -uid "533CAF3F-4C11-CC9E-82C8-71AF4CB60943";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 10 ".ktv[0:9]"  0 1 12 1 24 1 32 1 40 1 46 1 52 1 58 1 64 1
		 71 1;
	setAttr -s 10 ".kit[3:9]"  1 1 18 18 18 18 1;
	setAttr -s 10 ".kot[0:9]"  1 18 18 1 1 18 18 18 
		18 18;
	setAttr -s 10 ".kix[3:9]"  1 1 1 1 1 1 1;
	setAttr -s 10 ".kiy[3:9]"  0 0 0 0 0 0 0;
	setAttr -s 10 ".kox[0:9]"  1 1 1 1 1 1 1 1 1 1;
	setAttr -s 10 ".koy[0:9]"  0 0 0 0 0 0 0 0 0 0;
createNode animCurveTL -n "CURVE171";
	rename -uid "2E7DAD20-41C3-6F44-F6A0-D08FF0D681A5";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 13 ".ktv[0:12]"  0 0 12 0 24 0 32 0 40 0 46 0 49 0 52 0 55 0
		 58 0 61 0 64 0 71 0;
	setAttr -s 13 ".kit[3:12]"  1 1 18 18 18 18 18 18 
		18 1;
	setAttr -s 13 ".kot[0:12]"  1 18 18 1 1 18 18 18 
		18 18 18 18 18;
	setAttr -s 13 ".kix[3:12]"  1 1 1 1 1 1 1 1 1 1;
	setAttr -s 13 ".kiy[3:12]"  0 0 0 0 0 0 0 0 0 0;
	setAttr -s 13 ".kox[0:12]"  1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 13 ".koy[0:12]"  0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTL -n "CURVE172";
	rename -uid "14C5CC9E-401F-E588-9F58-F8826C7879E6";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 13 ".ktv[0:12]"  0 0 12 0 24 0 32 0 40 0 46 0 49 0 52 0 55 0
		 58 0 61 0 64 0 71 0;
	setAttr -s 13 ".kit[3:12]"  1 1 18 18 18 18 18 18 
		18 1;
	setAttr -s 13 ".kot[0:12]"  1 18 18 1 1 18 18 18 
		18 18 18 18 18;
	setAttr -s 13 ".kix[3:12]"  1 1 1 1 1 1 1 1 1 1;
	setAttr -s 13 ".kiy[3:12]"  0 0 0 0 0 0 0 0 0 0;
	setAttr -s 13 ".kox[0:12]"  1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 13 ".koy[0:12]"  0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTL -n "CURVE173";
	rename -uid "51472CB0-4397-4F6E-334C-82B9530060FD";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 13 ".ktv[0:12]"  0 0 12 0 24 0 32 0 40 0 46 0 49 0 52 0 55 0
		 58 0 61 0 64 0 71 0;
	setAttr -s 13 ".kit[3:12]"  1 1 18 18 18 18 18 18 
		18 1;
	setAttr -s 13 ".kot[0:12]"  1 18 18 1 1 18 18 18 
		18 18 18 18 18;
	setAttr -s 13 ".kix[3:12]"  1 1 1 1 1 1 1 1 1 1;
	setAttr -s 13 ".kiy[3:12]"  0 0 0 0 0 0 0 0 0 0;
	setAttr -s 13 ".kox[0:12]"  1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 13 ".koy[0:12]"  0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTU -n "CURVE174";
	rename -uid "2958812E-456A-0066-0358-FD8618F73E1F";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 13 ".ktv[0:12]"  0 1 12 1 24 1 32 1 40 1 46 1 49 1 52 1 55 1
		 58 1 61 1 64 1 71 1;
	setAttr -s 13 ".kit[3:12]"  1 1 18 18 18 18 18 18 
		18 1;
	setAttr -s 13 ".kot[0:12]"  1 18 18 1 1 18 18 18 
		18 18 18 18 18;
	setAttr -s 13 ".kix[3:12]"  1 1 1 1 1 1 1 1 1 1;
	setAttr -s 13 ".kiy[3:12]"  0 0 0 0 0 0 0 0 0 0;
	setAttr -s 13 ".kox[0:12]"  1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 13 ".koy[0:12]"  0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTU -n "CURVE175";
	rename -uid "6451A70A-4EBD-D087-D836-85AF7DB852CD";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 13 ".ktv[0:12]"  0 1 12 1 24 1 32 1 40 1 46 1 49 1 52 1 55 1
		 58 1 61 1 64 1 71 1;
	setAttr -s 13 ".kit[3:12]"  1 1 18 18 18 18 18 18 
		18 1;
	setAttr -s 13 ".kot[0:12]"  1 18 18 1 1 18 18 18 
		18 18 18 18 18;
	setAttr -s 13 ".kix[3:12]"  1 1 1 1 1 1 1 1 1 1;
	setAttr -s 13 ".kiy[3:12]"  0 0 0 0 0 0 0 0 0 0;
	setAttr -s 13 ".kox[0:12]"  1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 13 ".koy[0:12]"  0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTU -n "CURVE176";
	rename -uid "BA0F4016-4528-5123-C6B9-CF97FE46C1B6";
	setAttr ".tan" 5;
	setAttr ".wgt" no;
	setAttr -s 13 ".ktv[0:12]"  0 1 12 1 24 1 32 1 40 1 46 1 49 1 52 1 55 1
		 58 1 61 1 64 1 71 1;
	setAttr -s 13 ".kit[0:12]"  9 9 9 1 1 9 9 9 
		9 9 9 9 1;
	setAttr -s 13 ".kix[3:12]"  1 1 1 1 1 1 1 1 1 1;
	setAttr -s 13 ".kiy[3:12]"  0 0 0 0 0 0 0 0 0 0;
createNode animCurveTA -n "CURVE177";
	rename -uid "F5D1D048-4FD1-AD97-C3F1-D4B1549E9A5B";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 13 ".ktv[0:12]"  0 0 12 0 24 0 32 0 40 0 46 0 49 0 52 0 55 0
		 58 0 61 0 64 0 71 0;
	setAttr -s 13 ".kit[3:12]"  1 1 18 18 18 18 18 18 
		18 1;
	setAttr -s 13 ".kot[0:12]"  1 18 18 1 1 18 18 18 
		18 18 18 18 18;
	setAttr -s 13 ".kix[3:12]"  1 1 1 1 1 1 1 1 1 1;
	setAttr -s 13 ".kiy[3:12]"  0 0 0 0 0 0 0 0 0 0;
	setAttr -s 13 ".kox[0:12]"  1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 13 ".koy[0:12]"  0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTA -n "CURVE178";
	rename -uid "5A71372C-4D43-B3D6-1C07-928F34967872";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 13 ".ktv[0:12]"  0 0 12 10.758512266599112 24 10.758512266599112
		 32 0 40 0 46 0 49 0 52 0 55 0 58 0 61 0 64 0 71 0;
	setAttr -s 13 ".kit[3:12]"  1 1 18 18 18 18 18 18 
		18 1;
	setAttr -s 13 ".kot[0:12]"  1 18 18 1 1 18 18 18 
		18 18 18 18 18;
	setAttr -s 13 ".kix[3:12]"  1 1 1 1 1 1 1 1 1 1;
	setAttr -s 13 ".kiy[3:12]"  0 0 0 0 0 0 0 0 0 0;
	setAttr -s 13 ".kox[0:12]"  1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 13 ".koy[0:12]"  0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTA -n "CURVE179";
	rename -uid "EB7E2C6B-4416-9556-CA87-AA80FB199B78";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 13 ".ktv[0:12]"  0 0 12 0 24 0 32 0 40 0 46 90 49 70 52 90
		 55 70 58 90 61 70 64 90 71 5;
	setAttr -s 13 ".kit[3:12]"  1 1 18 18 18 18 18 18 
		18 1;
	setAttr -s 13 ".kot[0:12]"  1 18 18 1 1 18 18 18 
		18 18 18 18 18;
	setAttr -s 13 ".kix[3:12]"  1 1 1 1 1 1 1 1 1 1;
	setAttr -s 13 ".kiy[3:12]"  0 0 0 0 0 0 0 0 0 0;
	setAttr -s 13 ".kox[0:12]"  1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 13 ".koy[0:12]"  0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTU -n "CURVE180";
	rename -uid "AE01E06F-4605-F2B3-BC97-A1B790889516";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 13 ".ktv[0:12]"  0 1 12 1 24 1 32 1 40 1 46 1 49 1 52 1 55 1
		 58 1 61 1 64 1 71 1;
	setAttr -s 13 ".kit[3:12]"  1 1 18 18 18 18 18 18 
		18 1;
	setAttr -s 13 ".kot[0:12]"  1 18 18 1 1 18 18 18 
		18 18 18 18 18;
	setAttr -s 13 ".kix[3:12]"  1 1 1 1 1 1 1 1 1 1;
	setAttr -s 13 ".kiy[3:12]"  0 0 0 0 0 0 0 0 0 0;
	setAttr -s 13 ".kox[0:12]"  1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 13 ".koy[0:12]"  0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTL -n "CURVE182";
	rename -uid "06CF8756-4D70-657E-8144-49AAC7582983";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 10 ".ktv[0:9]"  0 0 12 0 24 0 32 0 40 0 46 0 52 0 58 0 64 0
		 71 0;
	setAttr -s 10 ".kit[3:9]"  1 1 18 18 18 18 1;
	setAttr -s 10 ".kot[0:9]"  1 18 18 1 1 18 18 18 
		18 18;
	setAttr -s 10 ".kix[3:9]"  1 1 1 1 1 1 1;
	setAttr -s 10 ".kiy[3:9]"  0 0 0 0 0 0 0;
	setAttr -s 10 ".kox[0:9]"  1 1 1 1 1 1 1 1 1 1;
	setAttr -s 10 ".koy[0:9]"  0 0 0 0 0 0 0 0 0 0;
createNode animCurveTL -n "CURVE183";
	rename -uid "8C5F8B44-46C8-82A7-738A-4A8CAB32D486";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 10 ".ktv[0:9]"  0 0 12 0 24 0 32 0 40 0 46 0 52 0 58 0 64 0
		 71 0;
	setAttr -s 10 ".kit[3:9]"  1 1 18 18 18 18 1;
	setAttr -s 10 ".kot[0:9]"  1 18 18 1 1 18 18 18 
		18 18;
	setAttr -s 10 ".kix[3:9]"  1 1 1 1 1 1 1;
	setAttr -s 10 ".kiy[3:9]"  0 0 0 0 0 0 0;
	setAttr -s 10 ".kox[0:9]"  1 1 1 1 1 1 1 1 1 1;
	setAttr -s 10 ".koy[0:9]"  0 0 0 0 0 0 0 0 0 0;
createNode animCurveTL -n "CURVE184";
	rename -uid "A3394835-4FA1-B8B4-E771-439F50224763";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 10 ".ktv[0:9]"  0 0 12 0 24 0 32 0 40 0 46 0 52 0 58 0 64 0
		 71 0;
	setAttr -s 10 ".kit[3:9]"  1 1 18 18 18 18 1;
	setAttr -s 10 ".kot[0:9]"  1 18 18 1 1 18 18 18 
		18 18;
	setAttr -s 10 ".kix[3:9]"  1 1 1 1 1 1 1;
	setAttr -s 10 ".kiy[3:9]"  0 0 0 0 0 0 0;
	setAttr -s 10 ".kox[0:9]"  1 1 1 1 1 1 1 1 1 1;
	setAttr -s 10 ".koy[0:9]"  0 0 0 0 0 0 0 0 0 0;
createNode animCurveTU -n "CURVE185";
	rename -uid "79A5177B-4D46-2390-9C3A-F1A83911BC67";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 10 ".ktv[0:9]"  0 1 12 1 24 1 32 1 40 1 46 1 52 1 58 1 64 1
		 71 1;
	setAttr -s 10 ".kit[3:9]"  1 1 18 18 18 18 1;
	setAttr -s 10 ".kot[0:9]"  1 18 18 1 1 18 18 18 
		18 18;
	setAttr -s 10 ".kix[3:9]"  1 1 1 1 1 1 1;
	setAttr -s 10 ".kiy[3:9]"  0 0 0 0 0 0 0;
	setAttr -s 10 ".kox[0:9]"  1 1 1 1 1 1 1 1 1 1;
	setAttr -s 10 ".koy[0:9]"  0 0 0 0 0 0 0 0 0 0;
createNode animCurveTU -n "CURVE186";
	rename -uid "52130D1E-4356-1305-DD29-DE9B397D5B68";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 10 ".ktv[0:9]"  0 1 12 1 24 1 32 1 40 1 46 1 52 1 58 1 64 1
		 71 1;
	setAttr -s 10 ".kit[3:9]"  1 1 18 18 18 18 1;
	setAttr -s 10 ".kot[0:9]"  1 18 18 1 1 18 18 18 
		18 18;
	setAttr -s 10 ".kix[3:9]"  1 1 1 1 1 1 1;
	setAttr -s 10 ".kiy[3:9]"  0 0 0 0 0 0 0;
	setAttr -s 10 ".kox[0:9]"  1 1 1 1 1 1 1 1 1 1;
	setAttr -s 10 ".koy[0:9]"  0 0 0 0 0 0 0 0 0 0;
createNode animCurveTU -n "CURVE187";
	rename -uid "430D59F0-4D9E-3E0F-67A1-009629A3EF05";
	setAttr ".tan" 5;
	setAttr ".wgt" no;
	setAttr -s 10 ".ktv[0:9]"  0 1 12 1 24 1 32 1 40 1 46 1 52 1 58 1 64 1
		 71 1;
	setAttr -s 10 ".kit[0:9]"  9 9 9 1 1 9 9 9 
		9 1;
	setAttr -s 10 ".kix[3:9]"  1 1 1 1 1 1 1;
	setAttr -s 10 ".kiy[3:9]"  0 0 0 0 0 0 0;
createNode animCurveTA -n "CURVE188";
	rename -uid "EDB319F6-4554-FE62-628F-50891AA3033D";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 10 ".ktv[0:9]"  0 0 12 0 24 0 32 0 40 0 46 0 52 0 58 0 64 0
		 71 -4.352336988280144e-05;
	setAttr -s 10 ".kit[3:9]"  1 1 18 18 18 18 1;
	setAttr -s 10 ".kot[0:9]"  1 18 18 1 1 18 18 18 
		18 18;
	setAttr -s 10 ".kix[3:9]"  1 1 1 1 1 1 1;
	setAttr -s 10 ".kiy[3:9]"  0 0 0 0 0 0 0;
	setAttr -s 10 ".kox[0:9]"  1 1 1 1 1 1 1 1 1 1;
	setAttr -s 10 ".koy[0:9]"  0 0 0 0 0 0 0 0 0 0;
createNode animCurveTA -n "CURVE189";
	rename -uid "30B41A1E-4B25-F01C-BB38-11814F4EC2EE";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 10 ".ktv[0:9]"  0 0 12 0 24 0 32 0 40 0 46 0 52 0 58 0 64 0
		 71 -5.9029329607082601e-06;
	setAttr -s 10 ".kit[3:9]"  1 1 18 18 18 18 1;
	setAttr -s 10 ".kot[0:9]"  1 18 18 1 1 18 18 18 
		18 18;
	setAttr -s 10 ".kix[3:9]"  1 1 1 1 1 1 1;
	setAttr -s 10 ".kiy[3:9]"  0 0 0 0 0 0 0;
	setAttr -s 10 ".kox[0:9]"  1 1 1 1 1 1 1 1 1 1;
	setAttr -s 10 ".koy[0:9]"  0 0 0 0 0 0 0 0 0 0;
createNode animCurveTA -n "CURVE190";
	rename -uid "D82CE613-4F77-561B-FF52-A982781F026C";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 10 ".ktv[0:9]"  0 0 12 0 24 0 32 0 40 0 46 0 52 0 58 0 64 0
		 71 4.3913654297657075e-05;
	setAttr -s 10 ".kit[3:9]"  1 1 18 18 18 18 1;
	setAttr -s 10 ".kot[0:9]"  1 18 18 1 1 18 18 18 
		18 18;
	setAttr -s 10 ".kix[3:9]"  1 1 1 1 1 1 1;
	setAttr -s 10 ".kiy[3:9]"  0 0 0 0 0 0 0;
	setAttr -s 10 ".kox[0:9]"  1 1 1 1 1 1 1 1 1 1;
	setAttr -s 10 ".koy[0:9]"  0 0 0 0 0 0 0 0 0 0;
createNode animCurveTU -n "CURVE191";
	rename -uid "CE667735-46C2-635C-B9CC-409FF2EF4AAE";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 10 ".ktv[0:9]"  0 1 12 1 24 1 32 1 40 1 46 1 52 1 58 1 64 1
		 71 1;
	setAttr -s 10 ".kit[3:9]"  1 1 18 18 18 18 1;
	setAttr -s 10 ".kot[0:9]"  1 18 18 1 1 18 18 18 
		18 18;
	setAttr -s 10 ".kix[3:9]"  1 1 1 1 1 1 1;
	setAttr -s 10 ".kiy[3:9]"  0 0 0 0 0 0 0;
	setAttr -s 10 ".kox[0:9]"  1 1 1 1 1 1 1 1 1 1;
	setAttr -s 10 ".koy[0:9]"  0 0 0 0 0 0 0 0 0 0;
createNode animCurveTL -n "CURVE193";
	rename -uid "10EEED50-4E52-79D5-1821-A1958969C13E";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 4 ".ktv[0:3]"  52 0 58 0 64 0 71 0;
	setAttr -s 4 ".kit[3]"  1;
	setAttr -s 4 ".kot[0:3]"  1 18 18 18;
	setAttr -s 4 ".kix[3]"  1;
	setAttr -s 4 ".kiy[3]"  0;
	setAttr -s 4 ".kox[0:3]"  1 1 1 1;
	setAttr -s 4 ".koy[0:3]"  0 0 0 0;
createNode animCurveTL -n "CURVE194";
	rename -uid "E7F2E09C-4699-CA0D-0F27-6083B450512B";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 4 ".ktv[0:3]"  52 0 58 0 64 0 71 0;
	setAttr -s 4 ".kit[3]"  1;
	setAttr -s 4 ".kot[0:3]"  1 18 18 18;
	setAttr -s 4 ".kix[3]"  1;
	setAttr -s 4 ".kiy[3]"  0;
	setAttr -s 4 ".kox[0:3]"  1 1 1 1;
	setAttr -s 4 ".koy[0:3]"  0 0 0 0;
createNode animCurveTL -n "CURVE195";
	rename -uid "89BA5E76-429D-F79D-0C81-77AA67A1B6AD";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 4 ".ktv[0:3]"  52 0 58 0 64 0 71 0;
	setAttr -s 4 ".kit[3]"  1;
	setAttr -s 4 ".kot[0:3]"  1 18 18 18;
	setAttr -s 4 ".kix[3]"  1;
	setAttr -s 4 ".kiy[3]"  0;
	setAttr -s 4 ".kox[0:3]"  1 1 1 1;
	setAttr -s 4 ".koy[0:3]"  0 0 0 0;
createNode animCurveTU -n "CURVE196";
	rename -uid "C25BAFE3-4240-A6ED-C8D0-23861D99F182";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 4 ".ktv[0:3]"  52 1 58 1 64 1 71 1;
	setAttr -s 4 ".kit[3]"  1;
	setAttr -s 4 ".kot[0:3]"  1 18 18 18;
	setAttr -s 4 ".kix[3]"  1;
	setAttr -s 4 ".kiy[3]"  0;
	setAttr -s 4 ".kox[0:3]"  1 1 1 1;
	setAttr -s 4 ".koy[0:3]"  0 0 0 0;
createNode animCurveTU -n "CURVE197";
	rename -uid "36DF8F05-412C-8371-2AA1-86AC4B54F11C";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 4 ".ktv[0:3]"  52 1 58 1 64 1 71 1;
	setAttr -s 4 ".kit[3]"  1;
	setAttr -s 4 ".kot[0:3]"  1 18 18 18;
	setAttr -s 4 ".kix[3]"  1;
	setAttr -s 4 ".kiy[3]"  0;
	setAttr -s 4 ".kox[0:3]"  1 1 1 1;
	setAttr -s 4 ".koy[0:3]"  0 0 0 0;
createNode animCurveTU -n "CURVE198";
	rename -uid "7DE62CA8-4CD4-F500-313D-439B35565DAD";
	setAttr ".tan" 5;
	setAttr ".wgt" no;
	setAttr -s 4 ".ktv[0:3]"  52 1 58 1 64 1 71 1;
	setAttr -s 4 ".kit[0:3]"  9 9 9 1;
	setAttr -s 4 ".kix[3]"  1;
	setAttr -s 4 ".kiy[3]"  0;
createNode animCurveTA -n "CURVE199";
	rename -uid "EC5C50CE-4380-49A6-B6B6-5380DA504F60";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 4 ".ktv[0:3]"  52 0 58 0 64 0 71 0;
	setAttr -s 4 ".kit[3]"  1;
	setAttr -s 4 ".kot[0:3]"  1 18 18 18;
	setAttr -s 4 ".kix[3]"  1;
	setAttr -s 4 ".kiy[3]"  0;
	setAttr -s 4 ".kox[0:3]"  1 1 1 1;
	setAttr -s 4 ".koy[0:3]"  0 0 0 0;
createNode animCurveTA -n "CURVE200";
	rename -uid "6E895168-41E8-E92C-8F15-AAB6456DC06C";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 4 ".ktv[0:3]"  52 0 58 0 64 0 71 0;
	setAttr -s 4 ".kit[3]"  1;
	setAttr -s 4 ".kot[0:3]"  1 18 18 18;
	setAttr -s 4 ".kix[3]"  1;
	setAttr -s 4 ".kiy[3]"  0;
	setAttr -s 4 ".kox[0:3]"  1 1 1 1;
	setAttr -s 4 ".koy[0:3]"  0 0 0 0;
createNode animCurveTA -n "CURVE201";
	rename -uid "7D635D0C-4A77-0047-F7F8-BC827E2207C5";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 4 ".ktv[0:3]"  52 0 58 0 64 0 71 0;
	setAttr -s 4 ".kit[3]"  1;
	setAttr -s 4 ".kot[0:3]"  1 18 18 18;
	setAttr -s 4 ".kix[3]"  1;
	setAttr -s 4 ".kiy[3]"  0;
	setAttr -s 4 ".kox[0:3]"  1 1 1 1;
	setAttr -s 4 ".koy[0:3]"  0 0 0 0;
createNode animCurveTU -n "CURVE202";
	rename -uid "026F4989-4BB9-8E1C-5660-D280803CAF81";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 4 ".ktv[0:3]"  52 1 58 1 64 1 71 1;
	setAttr -s 4 ".kit[3]"  1;
	setAttr -s 4 ".kot[0:3]"  1 18 18 18;
	setAttr -s 4 ".kix[3]"  1;
	setAttr -s 4 ".kiy[3]"  0;
	setAttr -s 4 ".kox[0:3]"  1 1 1 1;
	setAttr -s 4 ".koy[0:3]"  0 0 0 0;
createNode animCurveTL -n "CURVE204";
	rename -uid "3A57C8C4-46B8-CA9A-AB35-28AE14607DD8";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 10 ".ktv[0:9]"  0 0 12 0 24 0 32 0 40 0 46 0 52 0 58 0 64 0
		 71 0;
	setAttr -s 10 ".kit[3:9]"  1 1 18 18 18 18 1;
	setAttr -s 10 ".kot[0:9]"  1 18 18 1 1 18 18 18 
		18 18;
	setAttr -s 10 ".kix[3:9]"  1 1 1 1 1 1 1;
	setAttr -s 10 ".kiy[3:9]"  0 0 0 0 0 0 0;
	setAttr -s 10 ".kox[0:9]"  1 1 1 1 1 1 1 1 1 1;
	setAttr -s 10 ".koy[0:9]"  0 0 0 0 0 0 0 0 0 0;
createNode animCurveTL -n "CURVE205";
	rename -uid "966D6B7A-4521-EA0C-5C27-B7A82DF2C9FB";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 10 ".ktv[0:9]"  0 0 12 0 24 0 32 0 40 0 46 0 52 0 58 0 64 0
		 71 0;
	setAttr -s 10 ".kit[3:9]"  1 1 18 18 18 18 1;
	setAttr -s 10 ".kot[0:9]"  1 18 18 1 1 18 18 18 
		18 18;
	setAttr -s 10 ".kix[3:9]"  1 1 1 1 1 1 1;
	setAttr -s 10 ".kiy[3:9]"  0 0 0 0 0 0 0;
	setAttr -s 10 ".kox[0:9]"  1 1 1 1 1 1 1 1 1 1;
	setAttr -s 10 ".koy[0:9]"  0 0 0 0 0 0 0 0 0 0;
createNode animCurveTL -n "CURVE206";
	rename -uid "A810C184-476F-FE47-04FF-3686DC5DAA1B";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 10 ".ktv[0:9]"  0 0 12 0 24 0 32 0 40 0 46 0 52 0 58 0 64 0
		 71 0;
	setAttr -s 10 ".kit[3:9]"  1 1 18 18 18 18 1;
	setAttr -s 10 ".kot[0:9]"  1 18 18 1 1 18 18 18 
		18 18;
	setAttr -s 10 ".kix[3:9]"  1 1 1 1 1 1 1;
	setAttr -s 10 ".kiy[3:9]"  0 0 0 0 0 0 0;
	setAttr -s 10 ".kox[0:9]"  1 1 1 1 1 1 1 1 1 1;
	setAttr -s 10 ".koy[0:9]"  0 0 0 0 0 0 0 0 0 0;
createNode animCurveTU -n "CURVE207";
	rename -uid "CAB0458F-4E06-9F17-CD99-12B0D064DCDE";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 10 ".ktv[0:9]"  0 1 12 1 24 1 32 1 40 1 46 1 52 1 58 1 64 1
		 71 1;
	setAttr -s 10 ".kit[3:9]"  1 1 18 18 18 18 1;
	setAttr -s 10 ".kot[0:9]"  1 18 18 1 1 18 18 18 
		18 18;
	setAttr -s 10 ".kix[3:9]"  1 1 1 1 1 1 1;
	setAttr -s 10 ".kiy[3:9]"  0 0 0 0 0 0 0;
	setAttr -s 10 ".kox[0:9]"  1 1 1 1 1 1 1 1 1 1;
	setAttr -s 10 ".koy[0:9]"  0 0 0 0 0 0 0 0 0 0;
createNode animCurveTU -n "CURVE208";
	rename -uid "A41F5B0B-4467-85C8-68D3-10819D1D371A";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 10 ".ktv[0:9]"  0 1 12 1 24 1 32 1 40 1 46 1 52 1 58 1 64 1
		 71 1;
	setAttr -s 10 ".kit[3:9]"  1 1 18 18 18 18 1;
	setAttr -s 10 ".kot[0:9]"  1 18 18 1 1 18 18 18 
		18 18;
	setAttr -s 10 ".kix[3:9]"  1 1 1 1 1 1 1;
	setAttr -s 10 ".kiy[3:9]"  0 0 0 0 0 0 0;
	setAttr -s 10 ".kox[0:9]"  1 1 1 1 1 1 1 1 1 1;
	setAttr -s 10 ".koy[0:9]"  0 0 0 0 0 0 0 0 0 0;
createNode animCurveTU -n "CURVE209";
	rename -uid "39685F2A-424F-7497-183D-85B13CDC6DB5";
	setAttr ".tan" 5;
	setAttr ".wgt" no;
	setAttr -s 10 ".ktv[0:9]"  0 1 12 1 24 1 32 1 40 1 46 1 52 1 58 1 64 1
		 71 1;
	setAttr -s 10 ".kit[0:9]"  9 9 9 1 1 9 9 9 
		9 1;
	setAttr -s 10 ".kix[3:9]"  1 1 1 1 1 1 1;
	setAttr -s 10 ".kiy[3:9]"  0 0 0 0 0 0 0;
createNode animCurveTA -n "CURVE210";
	rename -uid "F10849E8-479E-6459-7108-D0B390EC48DD";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 10 ".ktv[0:9]"  0 0 12 0 24 0 32 0 40 0 46 0 52 0 58 0 64 0
		 71 0;
	setAttr -s 10 ".kit[3:9]"  1 1 18 18 18 18 1;
	setAttr -s 10 ".kot[0:9]"  1 18 18 1 1 18 18 18 
		18 18;
	setAttr -s 10 ".kix[3:9]"  1 1 1 1 1 1 1;
	setAttr -s 10 ".kiy[3:9]"  0 0 0 0 0 0 0;
	setAttr -s 10 ".kox[0:9]"  1 1 1 1 1 1 1 1 1 1;
	setAttr -s 10 ".koy[0:9]"  0 0 0 0 0 0 0 0 0 0;
createNode animCurveTA -n "CURVE211";
	rename -uid "8933C862-4DA0-1014-D63A-F88070333F49";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 10 ".ktv[0:9]"  0 0 12 0 24 0 32 0 40 0 46 0 52 0 58 0 64 0
		 71 0;
	setAttr -s 10 ".kit[3:9]"  1 1 18 18 18 18 1;
	setAttr -s 10 ".kot[0:9]"  1 18 18 1 1 18 18 18 
		18 18;
	setAttr -s 10 ".kix[3:9]"  1 1 1 1 1 1 1;
	setAttr -s 10 ".kiy[3:9]"  0 0 0 0 0 0 0;
	setAttr -s 10 ".kox[0:9]"  1 1 1 1 1 1 1 1 1 1;
	setAttr -s 10 ".koy[0:9]"  0 0 0 0 0 0 0 0 0 0;
createNode animCurveTA -n "CURVE212";
	rename -uid "68B7B1A3-4834-8059-30FD-F6BD7278378D";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 10 ".ktv[0:9]"  0 0 12 0 24 0 32 0 40 0 46 0 52 0 58 0 64 0
		 71 0;
	setAttr -s 10 ".kit[3:9]"  1 1 18 18 18 18 1;
	setAttr -s 10 ".kot[0:9]"  1 18 18 1 1 18 18 18 
		18 18;
	setAttr -s 10 ".kix[3:9]"  1 1 1 1 1 1 1;
	setAttr -s 10 ".kiy[3:9]"  0 0 0 0 0 0 0;
	setAttr -s 10 ".kox[0:9]"  1 1 1 1 1 1 1 1 1 1;
	setAttr -s 10 ".koy[0:9]"  0 0 0 0 0 0 0 0 0 0;
createNode animCurveTU -n "CURVE213";
	rename -uid "C25D429A-4894-CBA0-80E0-D786F593448C";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 10 ".ktv[0:9]"  0 1 12 1 24 1 32 1 40 1 46 1 52 1 58 1 64 1
		 71 1;
	setAttr -s 10 ".kit[3:9]"  1 1 18 18 18 18 1;
	setAttr -s 10 ".kot[0:9]"  1 18 18 1 1 18 18 18 
		18 18;
	setAttr -s 10 ".kix[3:9]"  1 1 1 1 1 1 1;
	setAttr -s 10 ".kiy[3:9]"  0 0 0 0 0 0 0;
	setAttr -s 10 ".kox[0:9]"  1 1 1 1 1 1 1 1 1 1;
	setAttr -s 10 ".koy[0:9]"  0 0 0 0 0 0 0 0 0 0;
// End