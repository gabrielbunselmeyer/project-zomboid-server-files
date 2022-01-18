xof 0303txt 0032

template Frame {
  <3d82ab46-62da-11cf-ab39-0020af71e433>
  [...]
}

template Matrix4x4 {
  <f6f23f45-7686-11cf-8f52-0040333594a3>
  array FLOAT matrix[16];
}

template FrameTransformMatrix {
  <f6f23f41-7686-11cf-8f52-0040333594a3>
  Matrix4x4 frameMatrix;
}

template Vector {
  <3d82ab5e-62da-11cf-ab39-0020af71e433>
  FLOAT x;
  FLOAT y;
  FLOAT z;
}

template MeshFace {
  <3d82ab5f-62da-11cf-ab39-0020af71e433>
  DWORD nFaceVertexIndices;
  array DWORD faceVertexIndices[nFaceVertexIndices];
}

template Mesh {
  <3d82ab44-62da-11cf-ab39-0020af71e433>
  DWORD nVertices;
  array Vector vertices[nVertices];
  DWORD nFaces;
  array MeshFace faces[nFaces];
  [...]
}

template MeshNormals {
  <f6f23f43-7686-11cf-8f52-0040333594a3>
  DWORD nNormals;
  array Vector normals[nNormals];
  DWORD nFaceNormals;
  array MeshFace faceNormals[nFaceNormals];
}

template Coords2d {
  <f6f23f44-7686-11cf-8f52-0040333594a3>
  FLOAT u;
  FLOAT v;
}

template MeshTextureCoords {
  <f6f23f40-7686-11cf-8f52-0040333594a3>
  DWORD nTextureCoords;
  array Coords2d textureCoords[nTextureCoords];
}

template ColorRGBA {
  <35ff44e0-6c7c-11cf-8f52-0040333594a3>
  FLOAT red;
  FLOAT green;
  FLOAT blue;
  FLOAT alpha;
}

template IndexedColor {
  <1630b820-7842-11cf-8f52-0040333594a3>
  DWORD index;
  ColorRGBA indexColor;
}

template MeshVertexColors {
  <1630b821-7842-11cf-8f52-0040333594a3>
  DWORD nVertexColors;
  array IndexedColor vertexColors[nVertexColors];
}

template VertexElement {
  <f752461c-1e23-48f6-b9f8-8350850f336f>
  DWORD Type;
  DWORD Method;
  DWORD Usage;
  DWORD UsageIndex;
}

template DeclData {
  <bf22e553-292c-4781-9fea-62bd554bdd93>
  DWORD nElements;
  array VertexElement Elements[nElements];
  DWORD nDWords;
  array DWORD data[nDWords];
}

Frame DXCC_ROOT {
  FrameTransformMatrix {
     1.00000000, 0.00000000, 0.00000000, 0.00000000,
    0.00000000, 1.00000000, 0.00000000, 0.00000000,
    0.00000000, 0.00000000, 1.00000000, 0.00000000,
    0.00000000, 0.00000000, 0.00000000, 1.00000000;;
  }

  Frame r3sqg00262ea_obj {
    FrameTransformMatrix {
       1.00000000, 0.00000000, -0.00000000, 0.00000000,
      0.00000000, 1.00000000, -0.00000000, 0.00000000,
      -0.00000000, -0.00000000, 1.00000000, -0.00000000,
      0.00000000, 0.00000000, -0.00000000, 1.00000000;;
    }

    Frame Sphere008_Mesh {
      FrameTransformMatrix {
         1.00000000, 0.00000000, -0.00000000, 0.00000000,
        0.00000000, 1.00000000, -0.00000000, 0.00000000,
        -0.00000000, -0.00000000, 1.00000000, -0.00000000,
        0.00000000, 0.00000000, -0.00000000, 1.00000000;;
      }

      Mesh Sphere008_Mesh_mShape {
        168;
        0.01796400;0.00001600;0.09244300;,
        0.01858000;0.00001600;0.09804100;,
        0.01772000;-0.03068100;0.09022400;,
        0.01730500;-0.02805300;0.08645800;,
        0.11681300;0.00001600;0.08156100;,
        0.11615400;-0.02805400;0.07557600;,
        0.11656900;-0.03068100;0.07934200;,
        0.11742900;0.00001600;0.08715900;,
        0.11742900;0.00001600;0.08715900;,
        0.11656900;-0.03068100;0.07934200;,
        0.09280000;-0.03068100;0.08193000;,
        0.09366000;0.00001600;0.08974700;,
        0.01772000;-0.03068100;0.09022400;,
        0.01547600;-0.06012500;0.06984700;,
        0.01523000;-0.05632200;0.06761000;,
        0.01730500;-0.02805300;0.08645800;,
        0.11615400;-0.02805400;0.07557600;,
        0.11407900;-0.05632300;0.05672800;,
        0.11432500;-0.06012500;0.05896500;,
        0.11656900;-0.03068100;0.07934200;,
        0.11656900;-0.03068100;0.07934200;,
        0.11432500;-0.06012500;0.05896500;,
        0.09055600;-0.06012500;0.06155200;,
        0.09280000;-0.03068100;0.08193000;,
        0.01547600;-0.06012500;0.06984700;,
        0.02253400;-0.07281700;0.03441000;,
        0.02238700;-0.06823000;0.03307400;,
        0.01523000;-0.05632200;0.06761000;,
        0.11432500;-0.06012500;0.05896500;,
        0.11407900;-0.05632300;0.05672800;,
        0.11040800;-0.06823000;0.02338400;,
        0.11055500;-0.07281700;0.02472000;,
        0.11432500;-0.06012500;0.05896500;,
        0.11055500;-0.07281700;0.02472000;,
        0.09359100;-0.07281700;0.02660200;,
        0.09055600;-0.06012500;0.06155200;,
        0.06247000;-0.06823000;0.02867600;,
        0.06261700;-0.07281700;0.03001200;,
        0.09359100;-0.07281700;0.02660200;,
        0.09344400;-0.06823000;0.02526600;,
        0.06261700;-0.07281700;0.03001200;,
        0.07806800;-0.06012500;0.06324500;,
        0.09055600;-0.06012500;0.06155200;,
        0.09359100;-0.07281700;0.02660200;,
        0.06247000;-0.06823000;0.02867600;,
        0.02238700;-0.06823000;0.03307400;,
        0.02253400;-0.07281700;0.03441000;,
        0.06261700;-0.07281700;0.03001200;,
        0.07806800;-0.06012500;0.06324500;,
        0.06261700;-0.07281700;0.03001200;,
        0.02253400;-0.07281700;0.03441000;,
        0.01547600;-0.06012500;0.06984700;,
        0.07806800;-0.06012500;0.06324500;,
        0.01547600;-0.06012500;0.06984700;,
        0.01772000;-0.03068100;0.09022400;,
        0.08031100;-0.03068100;0.08362200;,
        0.08031100;-0.03068100;0.08362200;,
        0.01772000;-0.03068100;0.09022400;,
        0.01858000;0.00001600;0.09804100;,
        0.08117200;0.00001600;0.09143900;,
        0.01796400;0.00001600;0.09244300;,
        0.01730500;0.02808500;0.08645800;,
        0.01772000;0.03071200;0.09022400;,
        0.01858000;0.00001600;0.09804100;,
        0.11656900;0.03071200;0.07934200;,
        0.11615400;0.02808500;0.07557600;,
        0.11681300;0.00001600;0.08156100;,
        0.11742900;0.00001600;0.08715900;,
        0.09280000;0.03071200;0.08193000;,
        0.11656900;0.03071200;0.07934200;,
        0.11742900;0.00001600;0.08715900;,
        0.09366000;0.00001600;0.08974700;,
        0.01523000;0.05635400;0.06761000;,
        0.01547600;0.06015600;0.06984700;,
        0.01772000;0.03071200;0.09022400;,
        0.01730500;0.02808500;0.08645800;,
        0.11432500;0.06015600;0.05896500;,
        0.11407900;0.05635400;0.05672800;,
        0.11615400;0.02808500;0.07557600;,
        0.11656900;0.03071200;0.07934200;,
        0.09055600;0.06015600;0.06155200;,
        0.11432500;0.06015600;0.05896500;,
        0.11656900;0.03071200;0.07934200;,
        0.09280000;0.03071200;0.08193000;,
        0.02238700;0.06826200;0.03307400;,
        0.02253400;0.07284800;0.03441000;,
        0.01547600;0.06015600;0.06984700;,
        0.01523000;0.05635400;0.06761000;,
        0.11432500;0.06015600;0.05896500;,
        0.11055500;0.07284800;0.02472000;,
        0.11040800;0.06826200;0.02338400;,
        0.11407900;0.05635400;0.05672800;,
        0.09132200;0.07284800;0.02683800;,
        0.11055500;0.07284800;0.02472000;,
        0.11432500;0.06015600;0.05896500;,
        0.09055600;0.06015600;0.06155200;,
        0.09132200;0.07284800;0.02683800;,
        0.06034800;0.07284800;0.03024800;,
        0.06020100;0.06826200;0.02891100;,
        0.09117400;0.06826200;0.02550100;,
        0.09055600;0.06015600;0.06155200;,
        0.07806800;0.06015600;0.06324500;,
        0.06034800;0.07284800;0.03024800;,
        0.09132200;0.07284800;0.02683800;,
        0.02253400;0.07284800;0.03441000;,
        0.02238700;0.06826200;0.03307400;,
        0.06020100;0.06826200;0.02891100;,
        0.06034800;0.07284800;0.03024800;,
        0.07806800;0.06015600;0.06324500;,
        0.01547600;0.06015600;0.06984700;,
        0.02253400;0.07284800;0.03441000;,
        0.06034800;0.07284800;0.03024800;,
        0.01772000;0.03071200;0.09022400;,
        0.01547600;0.06015600;0.06984700;,
        0.07806800;0.06015600;0.06324500;,
        0.08031100;0.03071200;0.08362200;,
        0.01858000;0.00001600;0.09804100;,
        0.01772000;0.03071200;0.09022400;,
        0.08031100;0.03071200;0.08362200;,
        0.08117200;0.00001600;0.09143900;,
        0.09344400;-0.06823000;0.02526600;,
        0.09359100;-0.07281700;0.02660200;,
        0.11055500;-0.07281700;0.02472000;,
        0.11040800;-0.06823000;0.02338400;,
        0.11040800;0.06826200;0.02338400;,
        0.11055500;0.07284800;0.02472000;,
        0.09132200;0.07284800;0.02683800;,
        0.09117400;0.06826200;0.02550100;,
        0.09031000;-0.05632300;0.05931600;,
        0.09238500;-0.02805300;0.07816300;,
        0.09280000;-0.03068100;0.08193000;,
        0.09055600;-0.06012500;0.06155200;,
        0.09366000;0.00001600;0.08974700;,
        0.09280000;-0.03068100;0.08193000;,
        0.09238500;-0.02805300;0.07816300;,
        0.09304400;0.00001600;0.08414800;,
        0.09238500;0.02808500;0.07816300;,
        0.09280000;0.03071200;0.08193000;,
        0.09366000;0.00001600;0.08974700;,
        0.09304400;0.00001600;0.08414800;,
        0.09031000;0.05635400;0.05931600;,
        0.09055600;0.06015600;0.06155200;,
        0.09280000;0.03071200;0.08193000;,
        0.09238500;0.02808500;0.07816300;,
        0.07782200;-0.05632200;0.06100900;,
        0.09031000;-0.05632300;0.05931600;,
        0.09055600;-0.06012500;0.06155200;,
        0.07806800;-0.06012500;0.06324500;,
        0.07782200;0.05635400;0.06100900;,
        0.07806800;0.06015600;0.06324500;,
        0.09055600;0.06015600;0.06155200;,
        0.09031000;0.05635400;0.05931600;,
        0.07782200;-0.05632200;0.06100900;,
        0.07806800;-0.06012500;0.06324500;,
        0.08031100;-0.03068100;0.08362200;,
        0.07989700;-0.02805300;0.07985600;,
        0.07989700;-0.02805300;0.07985600;,
        0.08031100;-0.03068100;0.08362200;,
        0.08117200;0.00001600;0.09143900;,
        0.08055600;0.00001600;0.08584100;,
        0.08117200;0.00001600;0.09143900;,
        0.08031100;0.03071200;0.08362200;,
        0.07989700;0.02808500;0.07985600;,
        0.08055600;0.00001600;0.08584100;,
        0.08031100;0.03071200;0.08362200;,
        0.07806800;0.06015600;0.06324500;,
        0.07782200;0.05635400;0.06100900;,
        0.07989700;0.02808500;0.07985600;;
        42;
        4;3,2,1,0;,
        4;7,6,5,4;,
        4;11,10,9,8;,
        4;15,14,13,12;,
        4;19,18,17,16;,
        4;23,22,21,20;,
        4;27,26,25,24;,
        4;31,30,29,28;,
        4;35,34,33,32;,
        4;39,38,37,36;,
        4;43,42,41,40;,
        4;47,46,45,44;,
        4;51,50,49,48;,
        4;55,54,53,52;,
        4;59,58,57,56;,
        4;63,62,61,60;,
        4;67,66,65,64;,
        4;71,70,69,68;,
        4;75,74,73,72;,
        4;79,78,77,76;,
        4;83,82,81,80;,
        4;87,86,85,84;,
        4;91,90,89,88;,
        4;95,94,93,92;,
        4;99,98,97,96;,
        4;103,102,101,100;,
        4;107,106,105,104;,
        4;111,110,109,108;,
        4;115,114,113,112;,
        4;119,118,117,116;,
        4;123,122,121,120;,
        4;127,126,125,124;,
        4;131,130,129,128;,
        4;135,134,133,132;,
        4;139,138,137,136;,
        4;143,142,141,140;,
        4;147,146,145,144;,
        4;151,150,149,148;,
        4;155,154,153,152;,
        4;159,158,157,156;,
        4;163,162,161,160;,
        4;167,166,165,164;;

        MeshMaterialList {
          1;
          42;
          0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0;
          Material {
            1.0; 1.0; 1.0; 1.000000;;
            1.000000;
            0.000000; 0.000000; 0.000000;;
            0.000000; 0.000000; 0.000000;;
            TextureFilename { ""; }
          }
        }

        MeshNormals {
        168;
        0.99400002;-0.00000000;-0.10940000;,
        0.99400002;-0.00000000;-0.10940000;,
        0.99400002;-0.00000000;-0.10940000;,
        0.99400002;-0.00000000;-0.10940000;,
        -0.99400002;0.00000000;0.10940000;,
        -0.99400002;0.00000000;0.10940000;,
        -0.99400002;0.00000000;0.10940000;,
        -0.99400002;0.00000000;0.10940000;,
        -0.10820000;0.00000000;-0.99409997;,
        -0.09840000;0.41639999;-0.90390003;,
        -0.09840000;0.41650000;-0.90380001;,
        -0.10820000;0.00000000;-0.99409997;,
        0.99400002;-0.00000000;-0.10940000;,
        0.99720001;0.06330000;0.03880000;,
        0.99839997;0.05350000;0.01580000;,
        0.99400002;-0.00000000;-0.10940000;,
        -0.99400002;0.00000000;0.10940000;,
        -0.99400002;0.00000000;0.10940000;,
        -0.99400002;0.00000000;0.10940000;,
        -0.99400002;0.00000000;0.10940000;,
        -0.09840000;0.41639999;-0.90390003;,
        -0.06630000;0.79119998;-0.60799998;,
        -0.05790000;0.85159999;-0.52100003;,
        -0.09840000;0.41650000;-0.90380001;,
        0.99720001;0.06330000;0.03880000;,
        0.98070002;0.11380000;0.15920000;,
        0.98070002;0.11380000;0.15920000;,
        0.99839997;0.05350000;0.01580000;,
        -0.99400002;0.00000000;0.10940000;,
        -0.99400002;0.00000000;0.10940000;,
        -0.99400002;0.00000000;0.10940000;,
        -0.99400002;0.00000000;0.10940000;,
        -0.06630000;0.79119998;-0.60799998;,
        -0.03770000;0.93830001;-0.34380001;,
        -0.03880000;0.93849999;-0.34310001;,
        -0.05790000;0.85159999;-0.52100003;,
        0.10480000;0.28130001;0.95389998;,
        0.10480000;0.28130001;0.95389998;,
        0.10540000;0.28130001;0.95380002;,
        0.10540000;0.28130001;0.95380002;,
        -0.03810000;0.93879998;-0.34240001;,
        -0.05700000;0.85049999;-0.52289999;,
        -0.05790000;0.85159999;-0.52100003;,
        -0.03880000;0.93849999;-0.34310001;,
        0.10480000;0.28130001;0.95389998;,
        0.10470000;0.28130001;0.95389998;,
        0.10470000;0.28130001;0.95389998;,
        0.10480000;0.28130001;0.95389998;,
        -0.05700000;0.85049999;-0.52289999;,
        -0.03810000;0.93879998;-0.34240001;,
        -0.03670000;0.93879998;-0.34250000;,
        -0.06690000;0.77240002;-0.63160002;,
        -0.05700000;0.85049999;-0.52289999;,
        -0.06690000;0.77240002;-0.63160002;,
        -0.09540000;0.41659999;-0.90410000;,
        -0.09540000;0.41620001;-0.90420002;,
        -0.09540000;0.41620001;-0.90420002;,
        -0.09540000;0.41659999;-0.90410000;,
        -0.10490000;0.00000000;-0.99449998;,
        -0.10490000;0.00000000;-0.99449998;,
        0.99400002;-0.00000000;-0.10940000;,
        0.99400002;-0.00000000;-0.10940000;,
        0.99400002;-0.00000000;-0.10940000;,
        0.99400002;-0.00000000;-0.10940000;,
        -0.99400002;0.00000000;0.10940000;,
        -0.99400002;0.00000000;0.10940000;,
        -0.99400002;0.00000000;0.10940000;,
        -0.99400002;0.00000000;0.10940000;,
        -0.09840000;-0.41650000;-0.90380001;,
        -0.09840000;-0.41639999;-0.90390003;,
        -0.10820000;0.00000000;-0.99409997;,
        -0.10820000;0.00000000;-0.99409997;,
        0.99839997;-0.05350000;0.01580000;,
        0.99720001;-0.06330000;0.03880000;,
        0.99400002;-0.00000000;-0.10940000;,
        0.99400002;-0.00000000;-0.10940000;,
        -0.99400002;0.00000000;0.10940000;,
        -0.99400002;0.00000000;0.10940000;,
        -0.99400002;0.00000000;0.10940000;,
        -0.99400002;0.00000000;0.10940000;,
        -0.05790000;-0.85170001;-0.52090001;,
        -0.06630000;-0.79119998;-0.60799998;,
        -0.09840000;-0.41639999;-0.90390003;,
        -0.09840000;-0.41650000;-0.90380001;,
        0.98070002;-0.11380000;0.15920000;,
        0.98070002;-0.11380000;0.15920000;,
        0.99720001;-0.06330000;0.03880000;,
        0.99839997;-0.05350000;0.01580000;,
        -0.99400002;0.00000000;0.10940000;,
        -0.99400002;0.00000000;0.10940000;,
        -0.99400002;0.00000000;0.10940000;,
        -0.99400002;0.00000000;0.10940000;,
        -0.03880000;-0.93860000;-0.34290001;,
        -0.03760000;-0.93830001;-0.34369999;,
        -0.06630000;-0.79119998;-0.60799998;,
        -0.05790000;-0.85170001;-0.52090001;,
        0.10500000;-0.28130001;0.95380002;,
        0.10500000;-0.28130001;0.95380002;,
        0.10500000;-0.28130001;0.95380002;,
        0.10500000;-0.28130001;0.95380002;,
        -0.05790000;-0.85170001;-0.52090001;,
        -0.05700000;-0.85049999;-0.52280003;,
        -0.03800000;-0.93879998;-0.34230000;,
        -0.03880000;-0.93860000;-0.34290001;,
        0.10500000;-0.28130001;0.95380002;,
        0.10500000;-0.28130001;0.95380002;,
        0.10500000;-0.28130001;0.95380002;,
        0.10500000;-0.28130001;0.95380002;,
        -0.05700000;-0.85049999;-0.52280003;,
        -0.06690000;-0.77240002;-0.63160002;,
        -0.03670000;-0.93879998;-0.34250000;,
        -0.03800000;-0.93879998;-0.34230000;,
        -0.09540000;-0.41659999;-0.90410000;,
        -0.06690000;-0.77240002;-0.63160002;,
        -0.05700000;-0.85049999;-0.52280003;,
        -0.09540000;-0.41620001;-0.90420002;,
        -0.10490000;0.00000000;-0.99449998;,
        -0.09540000;-0.41659999;-0.90410000;,
        -0.09540000;-0.41620001;-0.90420002;,
        -0.10490000;0.00000000;-0.99449998;,
        0.10540000;0.28130001;0.95380002;,
        0.10540000;0.28130001;0.95380002;,
        0.10580000;0.28130001;0.95380002;,
        0.10580000;0.28130001;0.95380002;,
        0.10500000;-0.28130001;0.95380002;,
        0.10500000;-0.28130001;0.95380002;,
        0.10500000;-0.28130001;0.95380002;,
        0.10500000;-0.28130001;0.95380002;,
        0.99400002;-0.00000000;-0.10940000;,
        0.99400002;-0.00000000;-0.10940000;,
        0.99400002;-0.00000000;-0.10940000;,
        0.99400002;-0.00000000;-0.10940000;,
        0.99400002;-0.00000000;-0.10940000;,
        0.99400002;-0.00000000;-0.10940000;,
        0.99400002;-0.00000000;-0.10940000;,
        0.99400002;-0.00000000;-0.10940000;,
        0.99400002;-0.00000000;-0.10940000;,
        0.99400002;-0.00000000;-0.10940000;,
        0.99400002;-0.00000000;-0.10940000;,
        0.99400002;-0.00000000;-0.10940000;,
        0.99400002;-0.00000000;-0.10940000;,
        0.99400002;-0.00000000;-0.10940000;,
        0.99400002;-0.00000000;-0.10940000;,
        0.99400002;-0.00000000;-0.10940000;,
        -0.11560000;-0.50910002;-0.85290003;,
        -0.11560000;-0.50910002;-0.85290003;,
        -0.11560000;-0.50910002;-0.85290003;,
        -0.11560000;-0.50910002;-0.85290003;,
        -0.11560000;0.50910002;-0.85290003;,
        -0.11560000;0.50910002;-0.85290003;,
        -0.11560000;0.50910002;-0.85290003;,
        -0.11560000;0.50910002;-0.85290003;,
        -0.99400002;0.00000000;0.10940000;,
        -0.99400002;0.00000000;0.10940000;,
        -0.99400002;0.00000000;0.10940000;,
        -0.99400002;0.00000000;0.10940000;,
        -0.99400002;0.00000000;0.10940000;,
        -0.99400002;0.00000000;0.10940000;,
        -0.99400002;0.00000000;0.10940000;,
        -0.99400002;0.00000000;0.10940000;,
        -0.99400002;0.00000000;0.10940000;,
        -0.99400002;0.00000000;0.10940000;,
        -0.99400002;0.00000000;0.10940000;,
        -0.99400002;0.00000000;0.10940000;,
        -0.99400002;0.00000000;0.10940000;,
        -0.99400002;0.00000000;0.10940000;,
        -0.99400002;0.00000000;0.10940000;,
        -0.99400002;0.00000000;0.10940000;;
        42;
        4;3,2,1,0;,
        4;7,6,5,4;,
        4;11,10,9,8;,
        4;15,14,13,12;,
        4;19,18,17,16;,
        4;23,22,21,20;,
        4;27,26,25,24;,
        4;31,30,29,28;,
        4;35,34,33,32;,
        4;39,38,37,36;,
        4;43,42,41,40;,
        4;47,46,45,44;,
        4;51,50,49,48;,
        4;55,54,53,52;,
        4;59,58,57,56;,
        4;63,62,61,60;,
        4;67,66,65,64;,
        4;71,70,69,68;,
        4;75,74,73,72;,
        4;79,78,77,76;,
        4;83,82,81,80;,
        4;87,86,85,84;,
        4;91,90,89,88;,
        4;95,94,93,92;,
        4;99,98,97,96;,
        4;103,102,101,100;,
        4;107,106,105,104;,
        4;111,110,109,108;,
        4;115,114,113,112;,
        4;119,118,117,116;,
        4;123,122,121,120;,
        4;127,126,125,124;,
        4;131,130,129,128;,
        4;135,134,133,132;,
        4;139,138,137,136;,
        4;143,142,141,140;,
        4;147,146,145,144;,
        4;151,150,149,148;,
        4;155,154,153,152;,
        4;159,158,157,156;,
        4;163,162,161,160;,
        4;167,166,165,164;;
        }

        MeshTextureCoords {
        168;
        0.73184401;0.51921797;,
        0.72094703;0.51921099;,
        0.73616201;0.58096701;,
        0.74349397;0.57568699;,
        0.72595698;0.84854603;,
        0.73759401;0.79188001;,
        0.73027098;0.78657502;,
        0.71507299;0.84854603;,
        0.28003499;0.52316701;,
        0.28140301;0.47640502;,
        0.23520100;0.47708601;,
        0.23383300;0.52384698;,
        0.73616201;0.58096701;,
        0.77582598;0.64022100;,
        0.78017902;0.63257504;,
        0.74349397;0.57568699;,
        0.73759401;0.79188001;,
        0.77423799;0.73480999;,
        0.76988900;0.72713399;,
        0.73027098;0.78657502;,
        0.72155499;0.36725199;,
        0.78010899;0.36535299;,
        0.78016102;0.31778598;,
        0.72160602;0.31968403;,
        0.77582598;0.64022100;,
        0.84231502;0.66764700;,
        0.84491700;0.65842402;,
        0.78017902;0.63257504;,
        0.76988900;0.72713399;,
        0.77423799;0.73480999;,
        0.83906800;0.71077299;,
        0.83647001;0.70151299;,
        0.78010899;0.36535299;,
        0.85122901;0.36545998;,
        0.85120302;0.33150101;,
        0.78016102;0.31778598;,
        0.71725100;0.31420898;,
        0.70794302;0.31409198;,
        0.70794302;0.37576199;,
        0.71725100;0.37588000;,
        0.85120302;0.26950598;,
        0.77959502;0.29270899;,
        0.78016102;0.31778598;,
        0.85120302;0.33150101;,
        0.71725100;0.31420898;,
        0.71726203;0.23440099;,
        0.70795399;0.23428297;,
        0.70794302;0.31409198;,
        0.77959502;0.29270899;,
        0.85120302;0.26950598;,
        0.85122901;0.18928099;,
        0.78010899;0.16750199;,
        0.77959502;0.29270899;,
        0.78010899;0.16750199;,
        0.72155499;0.16939998;,
        0.72104001;0.29460800;,
        0.00184600;0.19093001;,
        0.12345000;0.18911600;,
        0.12488400;0.14235598;,
        0.00327900;0.14416999;,
        0.73184401;0.51921797;,
        0.74349397;0.46276599;,
        0.73616201;0.45747602;,
        0.72094703;0.51921099;,
        0.73027098;0.91051799;,
        0.73759401;0.90521401;,
        0.72595698;0.84854603;,
        0.71507299;0.84854603;,
        0.23391899;0.58569598;,
        0.28012100;0.58501500;,
        0.28003499;0.52316701;,
        0.23383300;0.52384698;,
        0.78017902;0.40592802;,
        0.77582598;0.39827597;,
        0.73616201;0.45747602;,
        0.74349397;0.46276599;,
        0.76988900;0.96996301;,
        0.77423799;0.96228701;,
        0.73759401;0.90521401;,
        0.73027098;0.91051799;,
        0.23520100;0.65744996;,
        0.28140301;0.65676999;,
        0.28012100;0.58501500;,
        0.23391899;0.58569598;,
        0.84491700;0.38387001;,
        0.84231597;0.37464303;,
        0.77582598;0.39827597;,
        0.78017902;0.40592802;,
        0.76988900;0.96996301;,
        0.83647001;0.99558902;,
        0.83906800;0.98632997;,
        0.77423799;0.96228701;,
        0.26802000;0.25798500;,
        0.26802000;0.21983802;,
        0.21238600;0.21331602;,
        0.21243900;0.26045299;,
        0.70791298;0.09137702;,
        0.70791298;0.15304703;,
        0.71524501;0.15372401;,
        0.71524501;0.09205300;,
        0.21243900;0.26045299;,
        0.21185800;0.28526199;,
        0.26802000;0.31941497;,
        0.26802000;0.25798500;,
        0.70791298;0.22833800;,
        0.71524501;0.22901398;,
        0.71524501;0.15372401;,
        0.70791298;0.15304703;,
        0.21185800;0.28526199;,
        0.21238600;0.40936399;,
        0.26802000;0.39441198;,
        0.26802000;0.31941497;,
        0.12488400;0.08050698;,
        0.12370300;0.00875098;,
        0.00209800;0.01056498;,
        0.00327900;0.08232099;,
        0.12488400;0.14235598;,
        0.12488400;0.08050698;,
        0.00327900;0.08232099;,
        0.00327900;0.14416999;,
        0.71725100;0.37588000;,
        0.70794302;0.37576199;,
        0.70795399;0.40954000;,
        0.71726203;0.40965700;,
        0.71524501;0.05375701;,
        0.70791298;0.05308098;,
        0.70791298;0.09137702;,
        0.71524501;0.09205300;,
        0.99911201;0.66076696;,
        0.96242601;0.60387897;,
        0.95509499;0.60915899;,
        0.99475801;0.66841304;,
        0.93988001;0.54740298;,
        0.95509499;0.60915899;,
        0.96242601;0.60387897;,
        0.95077699;0.54741001;,
        0.96242601;0.49095702;,
        0.95509499;0.48566800;,
        0.93988001;0.54740298;,
        0.95077699;0.54741001;,
        0.99911100;0.43412000;,
        0.99475801;0.42646801;,
        0.95509499;0.48566800;,
        0.96242601;0.49095702;,
        0.44770899;0.18640399;,
        0.44770899;0.16131002;,
        0.43907800;0.16142899;,
        0.43907800;0.18652201;,
        0.70537800;0.75641704;,
        0.71223098;0.75632101;,
        0.71223098;0.73123801;,
        0.70537800;0.73133302;,
        0.70691597;0.17349303;,
        0.70256799;0.16581601;,
        0.66294903;0.22525799;,
        0.67027199;0.23056197;,
        0.67027199;0.23056197;,
        0.66294903;0.22525799;,
        0.64775097;0.28722799;,
        0.65863502;0.28722900;,
        0.64775097;0.28722799;,
        0.66294903;0.34920001;,
        0.67027199;0.34389699;,
        0.65863502;0.28722900;,
        0.66294903;0.34920001;,
        0.70256799;0.40864497;,
        0.70691597;0.40096903;,
        0.67027199;0.34389699;;
        }
      }

    }

  }

}
