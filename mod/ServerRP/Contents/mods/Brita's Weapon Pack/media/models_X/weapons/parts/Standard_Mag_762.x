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

  Frame tigo71jxojr1_obj {
    FrameTransformMatrix {
       1.00000000, 0.00000000, -0.00000000, 0.00000000,
      0.00000000, 1.00000000, -0.00000000, 0.00000000,
      -0.00000000, -0.00000000, 1.00000000, -0.00000000,
      0.00000000, 0.00000000, -0.00000000, 1.00000000;;
    }

    Frame exjlfq1ls03a {
      FrameTransformMatrix {
         1.00000000, 0.00000000, -0.00000000, 0.00000000,
        0.00000000, 1.00000000, -0.00000000, 0.00000000,
        -0.00000000, -0.00000000, 1.00000000, -0.00000000,
        0.00000000, 0.00000000, -0.00000000, 1.00000000;;
      }

      Mesh exjlfq1ls03a_mShape {
        156;
        -0.00606600;0.15069300;-0.10097800;,
        0.00603800;0.15069300;-0.10097800;,
        -0.00606600;0.17171100;-0.06753500;,
        0.00603800;0.17171100;-0.06753500;,
        -0.00606600;0.17171100;-0.06753500;,
        0.00603800;0.15069300;-0.10097800;,
        0.00603800;0.12177200;0.00849900;,
        0.00603800;0.08086900;0.00849900;,
        -0.00606600;0.12177200;0.00849900;,
        -0.00606600;0.08086900;0.00849900;,
        -0.00606600;0.12177200;0.00849900;,
        0.00603800;0.08086900;0.00849900;,
        0.00603800;0.12291200;-0.00404600;,
        0.00603800;0.08086900;-0.00404600;,
        0.00603800;0.12177200;0.00849900;,
        0.00603800;0.08086900;0.00849900;,
        0.00603800;0.12177200;0.00849900;,
        0.00603800;0.08086900;-0.00404600;,
        -0.00606600;0.12291200;-0.00404600;,
        0.00603800;0.12291200;-0.00404600;,
        -0.00606600;0.12177200;0.00849900;,
        0.00603800;0.12177200;0.00849900;,
        -0.00606600;0.12177200;0.00849900;,
        0.00603800;0.12291200;-0.00404600;,
        -0.00606600;0.08086900;-0.00404600;,
        -0.00606600;0.12291200;-0.00404600;,
        -0.00606600;0.08086900;0.00849900;,
        -0.00606600;0.12177200;0.00849900;,
        -0.00606600;0.08086900;0.00849900;,
        -0.00606600;0.12291200;-0.00404600;,
        0.00603800;0.08086900;-0.00404600;,
        -0.00606600;0.08086900;-0.00404600;,
        0.00603800;0.08086900;0.00849900;,
        -0.00606600;0.08086900;0.00849900;,
        0.00603800;0.08086900;0.00849900;,
        -0.00606600;0.08086900;-0.00404600;,
        -0.00606600;0.08086900;-0.00404600;,
        0.00603800;0.08086900;-0.00404600;,
        -0.00606600;0.08219100;-0.00930700;,
        0.00603800;0.08219100;-0.00930700;,
        -0.00606600;0.08219100;-0.00930700;,
        0.00603800;0.08086900;-0.00404600;,
        -0.00606600;0.12291200;-0.00404600;,
        -0.00606600;0.08086900;-0.00404600;,
        -0.00606600;0.12370000;-0.00721000;,
        -0.00606600;0.08219100;-0.00930700;,
        -0.00606600;0.12370000;-0.00721000;,
        -0.00606600;0.08086900;-0.00404600;,
        0.00603800;0.12291200;-0.00404600;,
        -0.00606600;0.12291200;-0.00404600;,
        0.00603800;0.12370000;-0.00721000;,
        -0.00606600;0.12370000;-0.00721000;,
        0.00603800;0.12370000;-0.00721000;,
        -0.00606600;0.12291200;-0.00404600;,
        0.00603800;0.08086900;-0.00404600;,
        0.00603800;0.12291200;-0.00404600;,
        0.00603800;0.08219100;-0.00930700;,
        0.00603800;0.12370000;-0.00721000;,
        0.00603800;0.08219100;-0.00930700;,
        0.00603800;0.12291200;-0.00404600;,
        -0.00606600;0.08219100;-0.00930700;,
        0.00603800;0.08219100;-0.00930700;,
        -0.00606600;0.09406900;-0.04030400;,
        0.00603800;0.09406900;-0.04030400;,
        -0.00606600;0.09406900;-0.04030400;,
        0.00603800;0.08219100;-0.00930700;,
        -0.00606600;0.12370000;-0.00721000;,
        -0.00606600;0.08219100;-0.00930700;,
        -0.00606600;0.12930501;-0.02274400;,
        -0.00606600;0.09406900;-0.04030400;,
        -0.00606600;0.12930501;-0.02274400;,
        -0.00606600;0.08219100;-0.00930700;,
        0.00603800;0.12370000;-0.00721000;,
        -0.00606600;0.12370000;-0.00721000;,
        0.00603800;0.12930501;-0.02274400;,
        -0.00606600;0.12930501;-0.02274400;,
        0.00603800;0.12930501;-0.02274400;,
        -0.00606600;0.12370000;-0.00721000;,
        0.00603800;0.08219100;-0.00930700;,
        0.00603800;0.12370000;-0.00721000;,
        0.00603800;0.09406900;-0.04030400;,
        0.00603800;0.12930501;-0.02274400;,
        0.00603800;0.09406900;-0.04030400;,
        0.00603800;0.12370000;-0.00721000;,
        -0.00606600;0.09406900;-0.04030400;,
        0.00603800;0.09406900;-0.04030400;,
        -0.00606600;0.11520900;-0.07127100;,
        0.00603800;0.11520900;-0.07127100;,
        -0.00606600;0.11520900;-0.07127100;,
        0.00603800;0.09406900;-0.04030400;,
        -0.00606600;0.12930501;-0.02274400;,
        -0.00606600;0.09406900;-0.04030400;,
        -0.00606600;0.14655100;-0.04809000;,
        -0.00606600;0.11520900;-0.07127100;,
        -0.00606600;0.14655100;-0.04809000;,
        -0.00606600;0.09406900;-0.04030400;,
        0.00603800;0.12930501;-0.02274400;,
        -0.00606600;0.12930501;-0.02274400;,
        0.00603800;0.14655100;-0.04809000;,
        -0.00606600;0.14655100;-0.04809000;,
        0.00603800;0.14655100;-0.04809000;,
        -0.00606600;0.12930501;-0.02274400;,
        0.00603800;0.09406900;-0.04030400;,
        0.00603800;0.12930501;-0.02274400;,
        0.00603800;0.11520900;-0.07127100;,
        0.00603800;0.14655100;-0.04809000;,
        0.00603800;0.11520900;-0.07127100;,
        0.00603800;0.12930501;-0.02274400;,
        -0.00606600;0.11520900;-0.07127100;,
        0.00603800;0.11520900;-0.07127100;,
        -0.00606600;0.14830901;-0.09895900;,
        0.00603800;0.14830901;-0.09895900;,
        -0.00606600;0.14830901;-0.09895900;,
        0.00603800;0.11520900;-0.07127100;,
        -0.00606600;0.14655100;-0.04809000;,
        -0.00606600;0.11520900;-0.07127100;,
        -0.00606600;0.16981000;-0.06666600;,
        -0.00606600;0.14830901;-0.09895900;,
        -0.00606600;0.16981000;-0.06666600;,
        -0.00606600;0.11520900;-0.07127100;,
        0.00603800;0.14655100;-0.04809000;,
        -0.00606600;0.14655100;-0.04809000;,
        0.00603800;0.16981000;-0.06666600;,
        -0.00606600;0.16981000;-0.06666600;,
        0.00603800;0.16981000;-0.06666600;,
        -0.00606600;0.14655100;-0.04809000;,
        0.00603800;0.11520900;-0.07127100;,
        0.00603800;0.14655100;-0.04809000;,
        0.00603800;0.14830901;-0.09895900;,
        0.00603800;0.16981000;-0.06666600;,
        0.00603800;0.14830901;-0.09895900;,
        0.00603800;0.14655100;-0.04809000;,
        -0.00606600;0.14830901;-0.09895900;,
        0.00603800;0.14830901;-0.09895900;,
        -0.00606600;0.15069300;-0.10097800;,
        0.00603800;0.15069300;-0.10097800;,
        -0.00606600;0.15069300;-0.10097800;,
        0.00603800;0.14830901;-0.09895900;,
        -0.00606600;0.16981000;-0.06666600;,
        -0.00606600;0.14830901;-0.09895900;,
        -0.00606600;0.17171100;-0.06753500;,
        -0.00606600;0.15069300;-0.10097800;,
        -0.00606600;0.17171100;-0.06753500;,
        -0.00606600;0.14830901;-0.09895900;,
        0.00603800;0.16981000;-0.06666600;,
        -0.00606600;0.16981000;-0.06666600;,
        0.00603800;0.17171100;-0.06753500;,
        -0.00606600;0.17171100;-0.06753500;,
        0.00603800;0.17171100;-0.06753500;,
        -0.00606600;0.16981000;-0.06666600;,
        0.00603800;0.14830901;-0.09895900;,
        0.00603800;0.16981000;-0.06666600;,
        0.00603800;0.15069300;-0.10097800;,
        0.00603800;0.17171100;-0.06753500;,
        0.00603800;0.15069300;-0.10097800;,
        0.00603800;0.16981000;-0.06666600;;
        52;
        3;2,1,0;,
        3;5,4,3;,
        3;8,7,6;,
        3;11,10,9;,
        3;14,13,12;,
        3;17,16,15;,
        3;20,19,18;,
        3;23,22,21;,
        3;26,25,24;,
        3;29,28,27;,
        3;32,31,30;,
        3;35,34,33;,
        3;38,37,36;,
        3;41,40,39;,
        3;44,43,42;,
        3;47,46,45;,
        3;50,49,48;,
        3;53,52,51;,
        3;56,55,54;,
        3;59,58,57;,
        3;62,61,60;,
        3;65,64,63;,
        3;68,67,66;,
        3;71,70,69;,
        3;74,73,72;,
        3;77,76,75;,
        3;80,79,78;,
        3;83,82,81;,
        3;86,85,84;,
        3;89,88,87;,
        3;92,91,90;,
        3;95,94,93;,
        3;98,97,96;,
        3;101,100,99;,
        3;104,103,102;,
        3;107,106,105;,
        3;110,109,108;,
        3;113,112,111;,
        3;116,115,114;,
        3;119,118,117;,
        3;122,121,120;,
        3;125,124,123;,
        3;128,127,126;,
        3;131,130,129;,
        3;134,133,132;,
        3;137,136,135;,
        3;140,139,138;,
        3;143,142,141;,
        3;146,145,144;,
        3;149,148,147;,
        3;152,151,150;,
        3;155,154,153;;

        MeshMaterialList {
          1;
          52;
          0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0;
          Material {
            1.0; 1.0; 1.0; 1.000000;;
            1.000000;
            0.000000; 0.000000; 0.000000;;
            0.000000; 0.000000; 0.000000;;
            TextureFilename { ""; }
          }
        }

        MeshNormals {
        156;
        -0.00000000;-0.84670001;0.53210002;,
        -0.00000000;-0.84670001;0.53210002;,
        -0.00000000;-0.84670001;0.53210002;,
        -0.00000000;-0.84670001;0.53210002;,
        -0.00000000;-0.84670001;0.53210002;,
        -0.00000000;-0.84670001;0.53210002;,
        -0.00000000;-0.00000000;-1.00000000;,
        -0.00000000;-0.00000000;-1.00000000;,
        -0.00000000;-0.00000000;-1.00000000;,
        -0.00000000;-0.00000000;-1.00000000;,
        -0.00000000;-0.00000000;-1.00000000;,
        -0.00000000;-0.00000000;-1.00000000;,
        -1.00000000;-0.00000000;0.00000000;,
        -1.00000000;-0.00000000;0.00000000;,
        -1.00000000;-0.00000000;0.00000000;,
        -1.00000000;-0.00000000;0.00000000;,
        -1.00000000;-0.00000000;0.00000000;,
        -1.00000000;-0.00000000;0.00000000;,
        -0.00000000;-0.99589998;-0.09050000;,
        -0.00000000;-0.99589998;-0.09050000;,
        -0.00000000;-0.99589998;-0.09050000;,
        -0.00000000;-0.99589998;-0.09050000;,
        -0.00000000;-0.99589998;-0.09050000;,
        -0.00000000;-0.99589998;-0.09050000;,
        1.00000000;-0.00000000;0.00000000;,
        1.00000000;-0.00000000;0.00000000;,
        1.00000000;-0.00000000;0.00000000;,
        1.00000000;-0.00000000;0.00000000;,
        1.00000000;-0.00000000;0.00000000;,
        1.00000000;-0.00000000;0.00000000;,
        -0.00000000;1.00000000;0.00000000;,
        -0.00000000;1.00000000;0.00000000;,
        -0.00000000;1.00000000;0.00000000;,
        -0.00000000;1.00000000;0.00000000;,
        -0.00000000;1.00000000;0.00000000;,
        -0.00000000;1.00000000;0.00000000;,
        -0.00000000;0.96990001;0.24370000;,
        -0.00000000;0.96990001;0.24370000;,
        -0.00000000;0.96990001;0.24370000;,
        -0.00000000;0.96990001;0.24370000;,
        -0.00000000;0.96990001;0.24370000;,
        -0.00000000;0.96990001;0.24370000;,
        1.00000000;-0.00000000;0.00000000;,
        1.00000000;-0.00000000;0.00000000;,
        1.00000000;-0.00000000;0.00000000;,
        1.00000000;-0.00000000;0.00000000;,
        1.00000000;-0.00000000;0.00000000;,
        1.00000000;-0.00000000;0.00000000;,
        -0.00000000;-0.97039998;-0.24169999;,
        -0.00000000;-0.97039998;-0.24169999;,
        -0.00000000;-0.97039998;-0.24169999;,
        -0.00000000;-0.97039998;-0.24169999;,
        -0.00000000;-0.97039998;-0.24169999;,
        -0.00000000;-0.97039998;-0.24169999;,
        -1.00000000;-0.00000000;0.00000000;,
        -1.00000000;-0.00000000;0.00000000;,
        -1.00000000;-0.00000000;0.00000000;,
        -1.00000000;-0.00000000;0.00000000;,
        -1.00000000;-0.00000000;0.00000000;,
        -1.00000000;-0.00000000;0.00000000;,
        -0.00000000;0.93379998;0.35780001;,
        -0.00000000;0.93379998;0.35780001;,
        -0.00000000;0.93379998;0.35780001;,
        -0.00000000;0.93379998;0.35780001;,
        -0.00000000;0.93379998;0.35780001;,
        -0.00000000;0.93379998;0.35780001;,
        1.00000000;-0.00000000;0.00000000;,
        1.00000000;-0.00000000;0.00000000;,
        1.00000000;-0.00000000;0.00000000;,
        1.00000000;-0.00000000;0.00000000;,
        1.00000000;-0.00000000;0.00000000;,
        1.00000000;-0.00000000;0.00000000;,
        -0.00000000;-0.94059998;-0.33939999;,
        -0.00000000;-0.94059998;-0.33939999;,
        -0.00000000;-0.94059998;-0.33939999;,
        -0.00000000;-0.94059998;-0.33939999;,
        -0.00000000;-0.94059998;-0.33939999;,
        -0.00000000;-0.94059998;-0.33939999;,
        -1.00000000;-0.00000000;0.00000000;,
        -1.00000000;-0.00000000;0.00000000;,
        -1.00000000;-0.00000000;0.00000000;,
        -1.00000000;-0.00000000;0.00000000;,
        -1.00000000;-0.00000000;0.00000000;,
        -1.00000000;-0.00000000;0.00000000;,
        -0.00000000;0.82590002;0.56379998;,
        -0.00000000;0.82590002;0.56379998;,
        -0.00000000;0.82590002;0.56379998;,
        -0.00000000;0.82590002;0.56379998;,
        -0.00000000;0.82590002;0.56379998;,
        -0.00000000;0.82590002;0.56379998;,
        1.00000000;-0.00000000;0.00000000;,
        1.00000000;-0.00000000;0.00000000;,
        1.00000000;-0.00000000;0.00000000;,
        1.00000000;-0.00000000;0.00000000;,
        1.00000000;-0.00000000;0.00000000;,
        1.00000000;-0.00000000;0.00000000;,
        -0.00000000;-0.82679999;-0.56250000;,
        -0.00000000;-0.82679999;-0.56250000;,
        -0.00000000;-0.82679999;-0.56250000;,
        -0.00000000;-0.82679999;-0.56250000;,
        -0.00000000;-0.82679999;-0.56250000;,
        -0.00000000;-0.82679999;-0.56250000;,
        -1.00000000;-0.00000000;0.00000000;,
        -1.00000000;-0.00000000;0.00000000;,
        -1.00000000;-0.00000000;0.00000000;,
        -1.00000000;-0.00000000;0.00000000;,
        -1.00000000;-0.00000000;0.00000000;,
        -1.00000000;-0.00000000;0.00000000;,
        -0.00000000;0.64160001;0.76700002;,
        -0.00000000;0.64160001;0.76700002;,
        -0.00000000;0.64160001;0.76700002;,
        -0.00000000;0.64630002;0.76310003;,
        -0.00000000;0.64160001;0.76700002;,
        -0.00000000;0.64160001;0.76700002;,
        1.00000000;-0.00000000;0.00000000;,
        1.00000000;-0.00000000;0.00000000;,
        1.00000000;-0.00000000;0.00000000;,
        1.00000000;-0.00000000;0.00000000;,
        1.00000000;-0.00000000;0.00000000;,
        1.00000000;-0.00000000;0.00000000;,
        -0.00000000;-0.62410003;-0.78140002;,
        -0.00000000;-0.62410003;-0.78140002;,
        -0.00000000;-0.62410003;-0.78140002;,
        -0.00000000;-0.62410003;-0.78140002;,
        -0.00000000;-0.62410003;-0.78140002;,
        -0.00000000;-0.62410003;-0.78140002;,
        -1.00000000;-0.00000000;0.00000000;,
        -1.00000000;-0.00000000;0.00000000;,
        -1.00000000;-0.00000000;0.00000000;,
        -1.00000000;-0.00000000;0.00000000;,
        -1.00000000;-0.00000000;0.00000000;,
        -1.00000000;-0.00000000;0.00000000;,
        -0.00000000;0.64160001;0.76700002;,
        -0.00000000;0.64630002;0.76310003;,
        -0.00000000;0.64630002;0.76310003;,
        -0.00000000;0.64630002;0.76310003;,
        -0.00000000;0.64630002;0.76310003;,
        -0.00000000;0.64630002;0.76310003;,
        1.00000000;-0.00000000;0.00000000;,
        1.00000000;-0.00000000;0.00000000;,
        1.00000000;-0.00000000;0.00000000;,
        1.00000000;-0.00000000;0.00000000;,
        1.00000000;-0.00000000;0.00000000;,
        1.00000000;-0.00000000;0.00000000;,
        -0.00000000;-0.41580001;-0.90950000;,
        -0.00000000;-0.41580001;-0.90950000;,
        -0.00000000;-0.41580001;-0.90950000;,
        -0.00000000;-0.41580001;-0.90950000;,
        -0.00000000;-0.41580001;-0.90950000;,
        -0.00000000;-0.41580001;-0.90950000;,
        -1.00000000;-0.00000000;0.00000000;,
        -1.00000000;-0.00000000;0.00000000;,
        -1.00000000;-0.00000000;0.00000000;,
        -1.00000000;-0.00000000;0.00000000;,
        -1.00000000;-0.00000000;0.00000000;,
        -1.00000000;-0.00000000;0.00000000;;
        52;
        3;2,1,0;,
        3;5,4,3;,
        3;8,7,6;,
        3;11,10,9;,
        3;14,13,12;,
        3;17,16,15;,
        3;20,19,18;,
        3;23,22,21;,
        3;26,25,24;,
        3;29,28,27;,
        3;32,31,30;,
        3;35,34,33;,
        3;38,37,36;,
        3;41,40,39;,
        3;44,43,42;,
        3;47,46,45;,
        3;50,49,48;,
        3;53,52,51;,
        3;56,55,54;,
        3;59,58,57;,
        3;62,61,60;,
        3;65,64,63;,
        3;68,67,66;,
        3;71,70,69;,
        3;74,73,72;,
        3;77,76,75;,
        3;80,79,78;,
        3;83,82,81;,
        3;86,85,84;,
        3;89,88,87;,
        3;92,91,90;,
        3;95,94,93;,
        3;98,97,96;,
        3;101,100,99;,
        3;104,103,102;,
        3;107,106,105;,
        3;110,109,108;,
        3;113,112,111;,
        3;116,115,114;,
        3;119,118,117;,
        3;122,121,120;,
        3;125,124,123;,
        3;128,127,126;,
        3;131,130,129;,
        3;134,133,132;,
        3;137,136,135;,
        3;140,139,138;,
        3;143,142,141;,
        3;146,145,144;,
        3;149,148,147;,
        3;152,151,150;,
        3;155,154,153;;
        }

        MeshTextureCoords {
        156;
        0.89633203;0.99844199;,
        0.93776101;0.99844199;,
        0.89633203;0.89459801;,
        0.93776101;0.89459801;,
        0.89633203;0.89459801;,
        0.93776101;0.99844199;,
        0.12218300;0.20613098;,
        0.12218300;0.06837398;,
        0.08075400;0.20613098;,
        0.08075400;0.06837398;,
        0.08075400;0.20613098;,
        0.12218300;0.06837398;,
        0.15320800;0.54350501;,
        0.03293000;0.62230003;,
        0.17351900;0.58143902;,
        0.05650200;0.65809703;,
        0.17351900;0.58143902;,
        0.03293000;0.62230003;,
        0.84183401;0.11258900;,
        0.88326198;0.11258900;,
        0.84183401;0.06961900;,
        0.88326198;0.06961900;,
        0.84183401;0.06961900;,
        0.88326198;0.11258900;,
        0.56916600;0.58589697;,
        0.68944401;0.66469204;,
        0.59273797;0.55009997;,
        0.70975500;0.62675899;,
        0.59273797;0.55009997;,
        0.68944401;0.66469204;,
        0.49418601;0.29190397;,
        0.53561401;0.29190397;,
        0.49418601;0.24970299;,
        0.53561401;0.24970299;,
        0.49418601;0.24970299;,
        0.53561401;0.29190397;,
        0.53561401;0.29190397;,
        0.49418601;0.29190397;,
        0.53561401;0.31037098;,
        0.49418601;0.31037098;,
        0.53561401;0.31037098;,
        0.49418601;0.29190397;,
        0.68944401;0.66469204;,
        0.56916600;0.58589697;,
        0.68575299;0.67519701;,
        0.56306201;0.60338700;,
        0.68575299;0.67519701;,
        0.56916600;0.58589697;,
        0.88326198;0.11258900;,
        0.84183401;0.11258900;,
        0.88326198;0.12364900;,
        0.84183401;0.12364900;,
        0.88326198;0.12364900;,
        0.84183401;0.11258900;,
        0.03293000;0.62230003;,
        0.15320800;0.54350501;,
        0.02682600;0.60481101;,
        0.14951700;0.53299999;,
        0.02682600;0.60481101;,
        0.15320800;0.54350501;,
        0.53561401;0.31037098;,
        0.49418601;0.31037098;,
        0.53561401;0.42155600;,
        0.49418601;0.42155600;,
        0.53561401;0.42155600;,
        0.49418601;0.31037098;,
        0.68575299;0.67519701;,
        0.56306201;0.60338700;,
        0.67259997;0.73002803;,
        0.53880000;0.71409702;,
        0.67259997;0.73002803;,
        0.56306201;0.60338700;,
        0.88326198;0.12364900;,
        0.84183401;0.12364900;,
        0.88326198;0.17872202;,
        0.84183401;0.17872202;,
        0.88326198;0.17872202;,
        0.84183401;0.12364900;,
        0.02682600;0.60481101;,
        0.14951700;0.53299999;,
        0.00256400;0.49409997;,
        0.13636400;0.47816998;,
        0.00256400;0.49409997;,
        0.14951700;0.53299999;,
        0.53561401;0.42155600;,
        0.49418601;0.42155600;,
        0.53561401;0.53803003;,
        0.49418601;0.53803003;,
        0.53561401;0.53803003;,
        0.49418601;0.42155600;,
        0.67259997;0.73002803;,
        0.53880000;0.71409702;,
        0.67431301;0.83467400;,
        0.54109102;0.84208000;,
        0.67431301;0.83467400;,
        0.53880000;0.71409702;,
        0.88326198;0.17872202;,
        0.84183401;0.17872202;,
        0.88326198;0.27218699;,
        0.84183401;0.27218699;,
        0.88326198;0.27218699;,
        0.84183401;0.17872202;,
        0.00256400;0.49409997;,
        0.13636400;0.47816998;,
        0.00485600;0.36611700;,
        0.13807701;0.37352401;,
        0.00485600;0.36611700;,
        0.13636400;0.47816998;,
        0.53561401;0.53803003;,
        0.49418601;0.53803003;,
        0.53561401;0.65043300;,
        0.49418601;0.65043300;,
        0.53561401;0.65043300;,
        0.49418601;0.53803003;,
        0.67431301;0.83467400;,
        0.54109102;0.84208000;,
        0.70594901;0.93127102;,
        0.58376002;0.98312199;,
        0.70594901;0.93127102;,
        0.54109102;0.84208000;,
        0.98043197;0.89447403;,
        0.93900400;0.89447403;,
        0.98043197;0.98318499;,
        0.93900400;0.98318499;,
        0.98043197;0.98318499;,
        0.93900400;0.89447403;,
        0.00485600;0.36611700;,
        0.13807701;0.37352401;,
        0.04752400;0.22507501;,
        0.16971301;0.27692598;,
        0.04752400;0.22507501;,
        0.13807701;0.37352401;,
        0.53561401;0.65043300;,
        0.49418601;0.65043300;,
        0.53561401;0.65861297;,
        0.49418601;0.65861297;,
        0.53561401;0.65861297;,
        0.49418601;0.65043300;,
        0.70594901;0.93127102;,
        0.58376002;0.98312199;,
        0.70975500;0.93731403;,
        0.58678597;0.99335098;,
        0.70975500;0.93731403;,
        0.58376002;0.98312199;,
        0.98043197;0.98318499;,
        0.93900400;0.98318499;,
        0.98043197;0.99007303;,
        0.93900400;0.99007303;,
        0.98043197;0.99007303;,
        0.93900400;0.98318499;,
        0.04752400;0.22507501;,
        0.16971301;0.27692598;,
        0.05055000;0.21484601;,
        0.17351900;0.27088398;,
        0.05055000;0.21484601;,
        0.16971301;0.27692598;;
        }
      }

    }

  }

}
