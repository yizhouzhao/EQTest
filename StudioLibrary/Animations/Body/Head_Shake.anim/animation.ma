//Maya ASCII 2020 scene
//Name: animation.ma
//Last modified: Mon, Jul 06, 2020 04:03:46 PM
//Codeset: 1252
requires maya "2020";
requires "stereoCamera" "10.0";
currentUnit -l centimeter -a degree -t pal;
fileInfo "application" "maya";
fileInfo "product" "Maya 2020";
fileInfo "version" "2020";
fileInfo "cutIdentifier" "201911140446-42a737a01c";
fileInfo "osv" "Microsoft Windows 10 Technical Preview  (Build 18362)\n";
fileInfo "UUID" "BCC4EFB4-4873-2713-60B7-ECAC7935E07F";
fileInfo "license" "student";
createNode animCurveTL -n "CURVE1";
	rename -uid "2EB6064E-4C2A-60E2-29B1-E39C8D15D131";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 6 ".ktv[0:5]"  0 0 6 0 18 0 30 0 42 0 48 0;
createNode animCurveTL -n "CURVE2";
	rename -uid "26A8A594-442F-581D-4C2F-9EA0E404AB52";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 6 ".ktv[0:5]"  0 0 6 0 18 0 30 0 42 0 48 0;
createNode animCurveTL -n "CURVE3";
	rename -uid "5033E98E-4284-959B-C6E6-47B2873E546E";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 6 ".ktv[0:5]"  0 0 6 0 18 0 30 0 42 0 48 0;
createNode animCurveTU -n "CURVE4";
	rename -uid "48D35698-43A0-C9EE-90D1-44B438148C61";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 6 ".ktv[0:5]"  0 1 6 1 18 1 30 1 42 1 48 1;
createNode animCurveTU -n "CURVE5";
	rename -uid "BABAACE3-45B0-6A75-1022-A98E740997D3";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 6 ".ktv[0:5]"  0 1 6 1 18 1 30 1 42 1 48 1;
createNode animCurveTU -n "CURVE6";
	rename -uid "ED083E7E-4DC7-E0EA-8BB3-8099C5FC4959";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 6 ".ktv[0:5]"  0 1 6 1 18 1 30 1 42 1 48 1;
	setAttr -s 6 ".kot[0:5]"  5 5 5 5 5 5;
createNode animCurveTA -n "CURVE7";
	rename -uid "44E43A90-4A05-2437-1AE7-E0BF8027B4F4";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 6 ".ktv[0:5]"  0 0 6 -20 18 19.999999999999996 30 -20 42 20
		 48 0;
createNode animCurveTA -n "CURVE8";
	rename -uid "448F6CB8-4B86-53F9-E77C-A1AEF6FE0AF5";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 6 ".ktv[0:5]"  0 0 6 0 18 0 30 0 42 0 48 0;
createNode animCurveTA -n "CURVE9";
	rename -uid "FE6DC5B3-4B05-3858-2D92-5DA2E878FD01";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 6 ".ktv[0:5]"  0 0 6 0 18 0 30 0 42 0 48 0;
createNode animCurveTU -n "CURVE10";
	rename -uid "FB6EBB78-4237-2952-74DB-84A73ACE11BF";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 6 ".ktv[0:5]"  0 1 6 1 18 1 30 1 42 1 48 1;
// End