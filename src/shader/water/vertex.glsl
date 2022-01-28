uniform float uBigWavesElevation;
uniform vec2 uBigWavesFrequency;
uniform float uTime;
uniform float uBigWavesSpeed;

void main() {
    vec4 modelPostion = modelMatrix * vec4(position, 1.0);

    float elevation = sin(modelPostion.x * uBigWavesFrequency.x + uTime * uBigWavesSpeed) *
                      sin(modelPostion.z * uBigWavesFrequency.y + uTime * uBigWavesSpeed) *
                      uBigWavesElevation;

    modelPostion.y += elevation;



    vec4 viewPosition = viewMatrix * modelPostion;
    vec4 projectedPosition = projectionMatrix * viewPosition;

    gl_Position = projectedPosition;
}

