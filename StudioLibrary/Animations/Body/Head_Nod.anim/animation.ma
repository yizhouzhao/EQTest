//Maya ASCII 2020 scene
//Name: animation.ma
//Last modified: Mon, Jul 06, 2020 04:06:58 PM
//Codeset: 1252
requires maya "2020";
requires "stereoCamera" "10.0";
currentUnit -l centimeter -a degree -t pal;
fileInfo "application" "maya";
fileInfo "product" "Maya 2020";
fileInfo "version" "2020";
fileInfo "cutIdentifier" "201911140446-42a737a01c";
fileInfo "osv" "Microsoft Windows 10 Technical Preview  (Build 18362)\n";
fileInfo "UUID" "CE1FD8ED-495B-07B4-2491-B7952239A597";
fileInfo "license" "student";
createNode animCurveTL -n "CURVE1";
	rename -uid "6669EFD5-4100-CC80-C038-C993DCF9A1EC";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 7 ".ktv[0:6]"  0 0 6 0 11 0 12 0 24 0 36 0 48 0;
createNode animCurveTL -n "CURVE2";
	rename -uid "797EF48F-4D9D-9443-DF0E-16BDB9B6014C";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 7 ".ktv[0:6]"  0 0 6 0 11 0 12 0 24 0 36 0 48 0;
createNode animCurveTL -n "CURVE3";
	rename -uid "DD512F27-4F87-570A-6BA7-7FB0968F070E";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 7 ".ktv[0:6]"  0 0 6 0 11 0 12 0 24 0 36 0 48 0;
createNode animCurveTU -n "CURVE4";
	rename -uid "457FCA2A-478B-7C9B-5D8F-E8B3E219C417";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 7 ".ktv[0:6]"  0 1 6 1 11 1 12 1 24 1 36 1 48 1;
createNode animCurveTU -n "CURVE5";
	rename -uid "1EB72B93-41FC-802C-B787-CD8D43AD36B3";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 7 ".ktv[0:6]"  0 1 6 1 11 1 12 1 24 1 36 1 48 1;
createNode animCurveTU -n "CURVE6";
	rename -uid "A9D29634-417F-0F78-9CE3-CBA2378FDF64";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 7 ".ktv[0:6]"  0 1 6 1 11 1 12 1 24 1 36 1 48 1;
	setAttr -s 7 ".kot[0:6]"  5 5 5 5 5 5 5;
createNode animCurveTA -n "CURVE7";
	rename -uid "CA319BB1-4899-D4CE-F7DC-6B8CA04CD583";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 7 ".ktv[0:6]"  0 0 6 0 11 0 12 0 24 0 36 0 48 0;
createNode animCurveTA -n "CURVE8";
	rename -uid "65DA022E-4D01-54F9-E491-2F81A307F95C";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 7 ".ktv[0:6]"  0 0 6 0 11 0 12 0 24 0 36 0 48 0;
createNode animCurveTA -n "CURVE9";
	rename -uid "E98E64E3-44FC-876A-26BD-DB94E144EA1C";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  0 0 12 19.956962075296627 24 0 36 19.956962075296627
		 48 0;
createNode animCurveTU -n "CURVE10";
	rename -uid "CA9BD7CE-4C62-D1BF-8838-5C8375A19FDB";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 7 ".ktv[0:6]"  0 1 6 1 11 1 12 1 24 1 36 1 48 1;
// End