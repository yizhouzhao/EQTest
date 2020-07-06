//Maya ASCII 2020 scene
//Name: animation.ma
//Last modified: Mon, Jul 06, 2020 04:00:58 PM
//Codeset: 1252
requires maya "2020";
requires "stereoCamera" "10.0";
currentUnit -l centimeter -a degree -t pal;
fileInfo "application" "maya";
fileInfo "product" "Maya 2020";
fileInfo "version" "2020";
fileInfo "cutIdentifier" "201911140446-42a737a01c";
fileInfo "osv" "Microsoft Windows 10 Technical Preview  (Build 18362)\n";
fileInfo "UUID" "6F007D84-4183-C1D8-4602-349052AF1E44";
fileInfo "license" "student";
createNode animCurveTL -n "CURVE1";
	rename -uid "B2178B05-490E-9204-BA88-AE8CFFEA684D";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 6 ".ktv[0:5]"  0 0 6 0 18 0 30 0 42 0 48 0;
createNode animCurveTL -n "CURVE2";
	rename -uid "D635833E-428D-5ECE-F73E-93849E530AE2";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 6 ".ktv[0:5]"  0 0 6 0 18 0 30 0 42 0 48 0;
createNode animCurveTL -n "CURVE3";
	rename -uid "40E9EA57-4B6D-ED3A-003E-B8B0DDE4F7AA";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 6 ".ktv[0:5]"  0 0 6 0 18 0 30 0 42 0 48 0;
createNode animCurveTU -n "CURVE4";
	rename -uid "C9900428-4393-586C-922C-FFB145AD8128";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 6 ".ktv[0:5]"  0 1 6 1 18 1 30 1 42 1 48 1;
createNode animCurveTU -n "CURVE5";
	rename -uid "761A0A73-42DA-8A4E-705E-7483EDCC04B1";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 6 ".ktv[0:5]"  0 1 6 1 18 1 30 1 42 1 48 1;
createNode animCurveTU -n "CURVE6";
	rename -uid "B3EE35B2-4005-73AB-2DAF-A4844E995E4E";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 6 ".ktv[0:5]"  0 1 6 1 18 1 30 1 42 1 48 1;
	setAttr -s 6 ".kot[0:5]"  5 5 5 5 5 5;
createNode animCurveTA -n "CURVE7";
	rename -uid "78329C80-4705-E80F-8587-29B7B98B5576";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 6 ".ktv[0:5]"  0 0 6 0 18 0 30 0 42 0 48 0;
createNode animCurveTA -n "CURVE8";
	rename -uid "51716D43-4B96-6B2D-08E3-489B1D622C0D";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 6 ".ktv[0:5]"  0 0 6 20 18 -9.6296296296296262 30 20 42 -20
		 48 0;
createNode animCurveTA -n "CURVE9";
	rename -uid "B8DB142C-4264-EACE-6995-D6B3D0BA9574";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 6 ".ktv[0:5]"  0 0 6 0 18 0 30 0 42 0 48 0;
createNode animCurveTU -n "CURVE10";
	rename -uid "0C566B13-4B03-DD8E-B29B-41B347688A82";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 6 ".ktv[0:5]"  0 1 6 1 18 1 30 1 42 1 48 1;
// End