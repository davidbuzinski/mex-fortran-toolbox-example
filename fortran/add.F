#include "fintrf.h"

      subroutine mexFunction(nlhs, plhs, nrhs, prhs)
      implicit none

      mwPointer plhs(*), prhs(*)
      integer nlhs, nrhs

      mwPointer mxGetDoubles, mxCreateDoubleScalar
      double precision mxGetScalar

      double precision a, b, c

C     Check for proper number of arguments
      if (nrhs .ne. 2) then
          call mexErrMsgIdAndTxt(
     +        'add:nrhs',
     +        'Two inputs required.')
      endif
      if (nlhs .gt. 1) then
          call mexErrMsgIdAndTxt(
     +        'add:nlhs',
     +        'One output allowed.')
      endif

C     Get input scalars
      a = mxGetScalar(prhs(1))
      b = mxGetScalar(prhs(2))

C     Compute the sum
      c = a + b

C     Create output and assign result
      plhs(1) = mxCreateDoubleScalar(c)

      return
      end
