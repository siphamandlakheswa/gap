#############################################################################
##
##  This file is part of GAP, a system for computational discrete algebra.
##  This file's authors include Thomas Breuer.
##
##  Copyright of GAP belongs to its developers, whose names are too numerous
##  to list here. Please refer to the COPYRIGHT file for details.
##
##  SPDX-License-Identifier: GPL-2.0-or-later
##
##  This file contains the declaration of operations for semigroups.
##

#############################################################################
##
#P  IsSemigroup( <D> )
##
##  <#GAPDoc Label="IsSemigroup">
##  <ManSection>
##  <Filt Name="IsSemigroup" Arg='D' Type='Synonym'/>
##
##  <Description>
##  returns <K>true</K> if the object <A>D</A> is a semigroup.
##  <Index>semigroup</Index>
##  A <E>semigroup</E> is a magma (see&nbsp;<Ref Chap="Magmas"/>) with
##  associative multiplication.
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareSynonymAttr( "IsSemigroup", IsMagma and IsAssociative );

##############################################################################
##
#O  InversesOfSemigroupElement( <S>, <x> )
##
##  <#GAPDoc Label="InversesOfSemigroupElement">
##  <ManSection>
##    <Oper Name="InversesOfSemigroupElement" Arg="S, x"/>
##    <Returns>A list of the inverses of an element of a semigroup.</Returns>
##    <Description>
##      <C>InversesOfSemigroupElement</C> returns a list of the inverses of
##      the element <A>x</A> in the semigroup <A>S</A>.<P/>
##       
##      An element <A>y</A> in <A>S</A> is an <E>inverse</E> of <A>x</A> if
##      <C><A>x</A>*y*<A>x</A>=<A>x</A></C> and <C>y*<A>x</A>*y=y</C>.
##      The element <A>x</A> has an inverse if and only if <A>x</A> is a
##      regular element of <A>S</A>.
##      <Example><![CDATA[
##  gap> S := Semigroup([
##  >  Transformation([3, 1, 4, 2, 5, 2, 1, 6, 1]), 
##  >  Transformation([5, 7, 8, 8, 7, 5, 9, 1, 9]), 
##  >  Transformation([7, 6, 2, 8, 4, 7, 5, 8, 3])]);
##  <transformation semigroup of degree 9 with 3 generators>
##  gap> x := Transformation([3, 1, 4, 2, 5, 2, 1, 6, 1]);;
##  gap> InversesOfSemigroupElement(S, x);
##  [  ]
##  gap> IsRegularSemigroupElement(S, x);
##  false
##  gap> x := Transformation([1, 9, 7, 5, 5, 1, 9, 5, 1]);;
##  gap> Set(InversesOfSemigroupElement(S, x));
##  [ Transformation( [ 1, 2, 3, 5, 5, 1, 3, 5, 2 ] ), 
##    Transformation( [ 1, 5, 1, 1, 5, 1, 3, 1, 2 ] ), 
##    Transformation( [ 1, 5, 1, 2, 5, 1, 3, 2, 2 ] ) ]
##  gap> IsRegularSemigroupElement(S, x);
##  true
##  gap> S := ReesZeroMatrixSemigroup(Group((1,2,3)),
##  >  [[(), ()], [(), 0], [(), (1,2,3)]]);;
##  gap> x := ReesZeroMatrixSemigroupElement(S, 2, (1,2,3), 3);;
##  gap> InversesOfSemigroupElement(S, x);
##  [ (1,(1,2,3),3), (1,(1,3,2),1), (2,(),3), (2,(1,2,3),1) ]]]></Example>
##    </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareOperation("InversesOfSemigroupElement", 
[IsSemigroup, IsMultiplicativeElement]);

#############################################################################
##
#F  Semigroup( <gen1>, <gen2> ... ) . . . . semigroup generated by collection
#F  Semigroup( <gens> ) . . . . . . . . . . semigroup generated by collection
##
##  <#GAPDoc Label="Semigroup">
##  <ManSection>
##  <Heading>Semigroup</Heading>
##  <Func Name="Semigroup" Arg='gen1, gen2 ...'
##   Label="for various generators"/>
##  <Func Name="Semigroup" Arg='gens' Label="for a list"/>
##
##  <Description>
##  In the first form, <Ref Func="Semigroup" Label="for various generators"/>
##  returns the semigroup generated by the arguments <A>gen1</A>,
##  <A>gen2</A>, <M>\ldots</M>,
##  that is, the closure of these elements under multiplication.
##  In the second form, <Ref Func="Semigroup" Label="for a list"/> returns
##  the semigroup generated by the elements in the homogeneous list
##  <A>gens</A>;
##  a square matrix as only argument is treated as one generator,
##  not as a list of generators.
##  <P/>
##  It is <E>not</E> checked whether the underlying multiplication is
##  associative, use <Ref Func="Magma"/> and <Ref Prop="IsAssociative"/>
##  if you want to check whether a magma is in fact a semigroup.
##  <P/>
##  <Example><![CDATA[
##  gap> a:= Transformation( [ 2, 3, 4, 1 ] );
##  Transformation( [ 2, 3, 4, 1 ] )
##  gap> b:= Transformation( [ 2, 2, 3, 4 ] );
##  Transformation( [ 2, 2 ] )
##  gap> s:= Semigroup(a, b);
##  <transformation semigroup of degree 4 with 2 generators>
##  ]]></Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareGlobalFunction( "Semigroup" );


#############################################################################
##
#F  Subsemigroup( <S>, <gens> ) . . .  subsemigroup of <S> generated by <gens>
#F  SubsemigroupNC( <S>, <gens> ) . .  subsemigroup of <S> generated by <gens>
##
##  <#GAPDoc Label="Subsemigroup">
##  <ManSection>
##  <Func Name="Subsemigroup" Arg='S, gens'/>
##  <Func Name="SubsemigroupNC" Arg='S, gens'/>
##
##  <Description>
##  are just synonyms of <Ref Func="Submagma"/> and <Ref Func="SubmagmaNC"/>,
##  respectively.
##  <P/>
##  <Example><![CDATA[
##  gap> a:=GeneratorsOfSemigroup(s)[1];
##  Transformation( [ 2, 3, 4, 1 ] )
##  gap> t:=Subsemigroup(s,[a]);
##  <commutative transformation semigroup of degree 4 with 1 generator>
##  ]]></Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareSynonym( "Subsemigroup", Submagma );

DeclareSynonym( "SubsemigroupNC", SubmagmaNC );


#############################################################################
##
#O  SemigroupByGenerators( <gens> ) . . . . . . semigroup generated by <gens>
##
##  <#GAPDoc Label="SemigroupByGenerators">
##  <ManSection>
##  <Oper Name="SemigroupByGenerators" Arg='gens'/>
##
##  <Description>
##  is the underlying operation
##  of&nbsp;<Ref Func="Semigroup" Label="for various generators"/>.
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareOperation( "SemigroupByGenerators", [ IsCollection ] );


#############################################################################
##
#A  AsSemigroup( <C> )  . . . . . . . .  collection <C> regarded as semigroup
##
##  <#GAPDoc Label="AsSemigroup">
##  <ManSection>
##  <Oper Name="AsSemigroup" Arg='C'/>
##
##  <Description>
##  If <A>C</A> is a collection whose elements form a semigroup
##  (see&nbsp;<Ref Filt="IsSemigroup"/>) then <Ref Oper="AsSemigroup"/>
##  returns this semigroup.
##  Otherwise <K>fail</K> is returned.
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareOperation( "AsSemigroup", [IsCollection]);

#############################################################################
##
#O  AsSubsemigroup( <D>, <C> )
##
##  <#GAPDoc Label="AsSubsemigroup">
##  <ManSection>
##  <Oper Name="AsSubsemigroup" Arg='D, C'/>
##
##  <Description>
##  Let <A>D</A> be a domain and <A>C</A> a collection.
##  If <A>C</A> is a subset of <A>D</A> that forms a semigroup then
##  <Ref Oper="AsSubsemigroup"/>
##  returns this semigroup, with parent <A>D</A>.
##  Otherwise <K>fail</K> is returned.
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareOperation( "AsSubsemigroup", [ IsDomain, IsCollection ] );


#############################################################################
##
#A  GeneratorsOfSemigroup( <S> ) . . .  semigroup generators of semigroup <S>
##
##  <#GAPDoc Label="GeneratorsOfSemigroup">
##  <ManSection>
##  <Attr Name="GeneratorsOfSemigroup" Arg='S'/>
##
##  <Description>
##  Semigroup generators of a semigroup <A>D</A> are the same as magma
##  generators, see&nbsp;<Ref Attr="GeneratorsOfMagma"/>.
##  <Example><![CDATA[
##  gap> GeneratorsOfSemigroup(s);
##  [ Transformation( [ 2, 3, 4, 1 ] ), Transformation( [ 2, 2 ] ) ]
##  gap> GeneratorsOfSemigroup(t);
##  [ Transformation( [ 2, 3, 4, 1 ] ) ]
##  ]]></Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareSynonymAttr( "GeneratorsOfSemigroup", GeneratorsOfMagma );

#############################################################################
##
#P  IsGeneratorsOfSemigroup( <C> ) . . .  list or collection of generators
##
##  <#GAPDoc Label="IsGeneratorsOfSemigroup">
##  <ManSection>
##  <Prop Name="IsGeneratorsOfSemigroup" Arg='C'/>
##
##  <Description>
##  This property reflects whether the list or collection <A>C</A> generates
##  a semigroup.
##  <Ref Filt="IsAssociativeElementCollection"/> implies 
##  &nbsp;<Ref Prop="IsGeneratorsOfSemigroup"/>,
##  but is not used directly in semigroup code, because of conflicts
##  with matrices.
##  
##  <Example><![CDATA[
##  gap> IsGeneratorsOfSemigroup([Transformation([2,3,1])]);
##  true
##  ]]></Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareProperty("IsGeneratorsOfSemigroup", IsListOrCollection);
InstallTrueMethod(IsGeneratorsOfSemigroup, IsSemigroup);
InstallTrueMethod(IsGeneratorsOfSemigroup, IsAssociativeElementCollection);

# the following covers the case of elements of a quotient semigroup
InstallTrueMethod(IsGeneratorsOfSemigroup, IsAssociativeElementCollColl);

#############################################################################
##
#A  CayleyGraphSemigroup( <S> ) 
#A  CayleyGraphDualSemigroup( <S> )
##
##  <ManSection>
##  <Attr Name="CayleyGraphSemigroup" Arg='S'/>
##  <Attr Name="CayleyGraphDualSemigroup" Arg='S'/>
##
##  <Description>
##  </Description>
##  </ManSection>
##
DeclareAttribute("CayleyGraphSemigroup",IsSemigroup);
DeclareAttribute("CayleyGraphDualSemigroup",IsSemigroup);

#############################################################################
##
#F  FreeSemigroup( [<wfilt>,]<rank> )
#F  FreeSemigroup( [<wfilt>,]<rank>, <name> )
#F  FreeSemigroup( [<wfilt>,]<name1>, <name2>, ... )
#F  FreeSemigroup( [<wfilt>,]<names> )
#F  FreeSemigroup( [<wfilt>,]infinity, <name>, <init> )
##
##  <#GAPDoc Label="FreeSemigroup">
##  <ManSection>
##  <Heading>FreeSemigroup</Heading>
##  <Func Name="FreeSemigroup" Arg='[wfilt, ]rank[, name]'
##   Label="for given rank"/>
##  <Func Name="FreeSemigroup" Arg='[wfilt, ]name1, name2, ...'
##   Label="for various names"/>
##  <Func Name="FreeSemigroup" Arg='[wfilt, ]names'
##   Label="for a list of names"/>
##  <Func Name="FreeSemigroup" Arg='[wfilt, ]infinity, name, init'
##   Label="for infinitely many generators"/>
##
##  <Description>
##  Called with a positive integer <A>rank</A>,
##  <Ref Func="FreeSemigroup" Label="for given rank"/> returns
##  a free semigroup on <A>rank</A> generators.
##  If the optional argument <A>name</A> is given then the generators are
##  printed as <A>name</A><C>1</C>, <A>name</A><C>2</C> etc.,
##  that is, each name is the concatenation of the string <A>name</A> and an
##  integer from <C>1</C> to <A>range</A>.
##  The default for <A>name</A> is the string <C>"s"</C>.
##  <P/>
##  Called in the second form,
##  <Ref Func="FreeSemigroup" Label="for various names"/> returns
##  a free semigroup on as many generators as arguments, printed as
##  <A>name1</A>, <A>name2</A> etc.
##  <P/>
##  Called in the third form,
##  <Ref Func="FreeSemigroup" Label="for a list of names"/> returns
##  a free semigroup on as many generators as the length of the list
##  <A>names</A>, the <M>i</M>-th generator being printed as
##  <A>names</A><M>[i]</M>.
##  <P/>
##  Called in the fourth form,
##  <Ref Func="FreeSemigroup" Label="for infinitely many generators"/>
##  returns a free semigroup on infinitely many generators, where the first
##  generators are printed by the names in the list <A>init</A>,
##  and the other generators by <A>name</A> and an appended number.
##  <P/>
##  If the extra argument <A>wfilt</A> is given, it must be either
##  <Ref Filt="IsSyllableWordsFamily"/> or <Ref Filt="IsLetterWordsFamily"/>
##  or <Ref Filt="IsWLetterWordsFamily"/> or
##  <Ref Filt="IsBLetterWordsFamily"/>.
##  This filter then specifies the representation used for the elements of
##  the free semigroup
##  (see&nbsp;<Ref Sect="Representations for Associative Words"/>).
##  If no such filter is given, a letter representation is used.
##  <P/>
##  <Example><![CDATA[
##  gap> f1 := FreeSemigroup( 3 );
##  <free semigroup on the generators [ s1, s2, s3 ]>
##  gap> f2 := FreeSemigroup( 3 , "generator" );
##  <free semigroup on the generators 
##  [ generator1, generator2, generator3 ]>
##  gap> f3 := FreeSemigroup( "gen1" , "gen2" );
##  <free semigroup on the generators [ gen1, gen2 ]>
##  gap> f4 := FreeSemigroup( ["gen1" , "gen2"] );
##  <free semigroup on the generators [ gen1, gen2 ]>
##  ]]></Example>
##  <P/>
##  For more on associative words see 
##  Chapter&nbsp;<Ref Chap="Associative Words"/>.
##  <P/>
##  Each free object defines a unique alphabet (and a unique family of words).
##  Its generators are the letters of this alphabet,
##  thus words of length one.
##  <P/>
##  <Example><![CDATA[
##  gap> FreeGroup( 5 );
##  <free group on the generators [ f1, f2, f3, f4, f5 ]>
##  gap> FreeGroup( "a", "b" );
##  <free group on the generators [ a, b ]>
##  gap> FreeGroup( infinity );
##  <free group with infinity generators>
##  gap> FreeSemigroup( "x", "y" );
##  <free semigroup on the generators [ x, y ]>
##  gap> FreeMonoid( 7 );
##  <free monoid on the generators [ m1, m2, m3, m4, m5, m6, m7 ]>
##  ]]></Example>
##  <P/>
##  Remember that names are just a help for printing and do not necessarily
##  distinguish letters.
##  It is possible to create arbitrarily weird situations by choosing strange
##  names for the letters.
##  <P/>
##  <Example><![CDATA[
##  gap> f:= FreeGroup( "x", "x" );  gens:= GeneratorsOfGroup( f );;
##  <free group on the generators [ x, x ]>
##  gap> gens[1] = gens[2];
##  false
##  gap> f:= FreeGroup( "f1*f2", "f2^-1", "Group( [ f1, f2 ] )" );
##  <free group on the generators [ f1*f2, f2^-1, Group( [ f1, f2 ] ) ]>
##  gap> gens:= GeneratorsOfGroup( f );;
##  gap> gens[1]*gens[2];
##  f1*f2*f2^-1
##  gap> gens[1]/gens[3];
##  f1*f2*Group( [ f1, f2 ] )^-1
##  gap> gens[3]/gens[1]/gens[2];
##  Group( [ f1, f2 ] )*f1*f2^-1*f2^-1^-1
##  ]]></Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareGlobalFunction( "FreeSemigroup" );


#############################################################################
##
#P  IsZeroGroup( <S> )  
##
##  <#GAPDoc Label="IsZeroGroup">
##  <ManSection>
##  <Prop Name="IsZeroGroup" Arg='S'/>
##
##  <Description>
##  is <K>true</K> if and only if the semigroup <A>S</A> is a group with zero
##  adjoined.
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareProperty( "IsZeroGroup", IsSemigroup );
InstallTrueMethod( IsSemigroup, IsZeroGroup );

#############################################################################
##
#P  IsSimpleSemigroup( <S> )  
##
##  <#GAPDoc Label="IsSimpleSemigroup">
##  <ManSection>
##  <Prop Name="IsSimpleSemigroup" Arg='S'/>
##
##  <Description>
##  is <K>true</K> if and only if the semigroup <A>S</A> has no proper
##  ideals.
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareProperty( "IsSimpleSemigroup", IsSemigroup );
InstallTrueMethod( IsSemigroup, IsSimpleSemigroup );

#############################################################################
##
#P  IsZeroSimpleSemigroup( <S> )  
##
##  <#GAPDoc Label="IsZeroSimpleSemigroup">
##  <ManSection>
##  <Prop Name="IsZeroSimpleSemigroup" Arg='S'/>
##
##  <Description>
##  is <K>true</K> if and only if the semigroup has no proper ideals except
##  for 0, where <A>S</A> is a semigroup with zero. 
##  If the semigroup does not find its zero, then a break-loop is entered.
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareProperty( "IsZeroSimpleSemigroup", IsSemigroup );
InstallTrueMethod( IsSemigroup, IsZeroSimpleSemigroup );


############################################################################
##
#A  ANonReesCongruenceOfSemigroup( <S> )
##
##  <ManSection>
##  <Attr Name="ANonReesCongruenceOfSemigroup" Arg='S'/>
##
##  <Description>
##  for a semigroup <A>S</A>, returns a non-Rees congruence if one exists
##  or otherwise returns <K>fail</K>.
##  </Description>
##  </ManSection>
##
DeclareAttribute("ANonReesCongruenceOfSemigroup",IsSemigroup);


############################################################################
##
#P  IsReesCongruenceSemigroup( <S> )
##
##  <#GAPDoc Label="IsReesCongruenceSemigroup">
##  <ManSection>
##  <Prop Name="IsReesCongruenceSemigroup" Arg='S'/>
##
##  <Description>
##  returns <K>true</K> if <A>S</A> is a Rees Congruence semigroup, that is,
##  if all congruences of <A>S</A> are Rees Congruences.
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareProperty( "IsReesCongruenceSemigroup", IsSemigroup );
InstallTrueMethod( IsSemigroup, IsReesCongruenceSemigroup );


#############################################################################
##
#O  HomomorphismFactorSemigroup( <S>, <C> )
#O  HomomorphismFactorSemigroupByClosure( <S>, <L> )
#O  FactorSemigroup( <S>, <C> )
#O  FactorSemigroupByClosure( <S>, <L> )
##
##  <ManSection>
##  <Oper Name="HomomorphismFactorSemigroup" Arg='S, C'/>
##  <Oper Name="HomomorphismFactorSemigroupByClosure" Arg='S, L'/>
##  <Oper Name="FactorSemigroup" Arg='S, C'/>
##  <Oper Name="FactorSemigroupByClosure" Arg='S, L'/>
##
##  <Description>
##  each find the quotient of <A>S</A> by a congruence.
##  <P/>
##  In the first form <A>C</A> is a congruence and
##  <Ref Func="HomomorphismFactorSemigroup"/>
##  returns a homomorphism <M><A>S</A> \rightarrow <A>S</A>/<A>C</A></M>.
##  <P/>
##  In the second form, <A>L</A> is a list of pairs of elements of <A>S</A>.
##  Returns a homomorphism <M><A>S</A> \rightarrow <A>S</A>/<A>C</A></M>,
##  where <A>C</A> is the congruence generated by <A>L</A>.
##  <P/>
##  <C>FactorSemigroup(<A>S</A>, <A>C</A>)</C> returns 
##    <C>Range( HomomorphismFactorSemigroup(<A>S</A>, <A>C</A>) )</C>.
##  <P/>
##  <C>FactorSemigroupByClosure(<A>S</A>, <A>L</A>)</C> returns 
##    <C>Range( HomomorphismFactorSemigroupByClosure(<A>S</A>, <A>L</A>) )</C>.
##  </Description>
##  </ManSection>
##
DeclareOperation( "HomomorphismFactorSemigroup",  
	[ IsSemigroup, IsSemigroupCongruence ] );

DeclareOperation( "HomomorphismFactorSemigroupByClosure",  
	[ IsSemigroup, IsList ] );

DeclareOperation( "FactorSemigroup",  
	[ IsSemigroup, IsSemigroupCongruence ] );

DeclareOperation( "FactorSemigroupByClosure",  
	[ IsSemigroup, IsList ] );


#############################################################################
##
#O  IsRegularSemigroupElement( <S>, <x> )
##
##  <#GAPDoc Label="IsRegularSemigroupElement">
##  <ManSection>
##  <Oper Name="IsRegularSemigroupElement" Arg='S, x'/>
##
##  <Description>
##  returns <K>true</K> if <A>x</A> has a general inverse in <A>S</A>, i.e.,
##  there is an element <M>y \in <A>S</A></M>
##  such that <M><A>x</A> y <A>x</A> = <A>x</A></M> and
##  <M>y <A>x</A> y = y</M>.
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareOperation("IsRegularSemigroupElement", [IsSemigroup, 
    IsMultiplicativeElement]);

#############################################################################
##
#P  IsRegularSemigroup( <S> )
##
##  <#GAPDoc Label="IsRegularSemigroup">
##  <ManSection>
##  <Prop Name="IsRegularSemigroup" Arg='S'/>
##
##  <Description>
##  returns <K>true</K> if <A>S</A> is regular, i.e.,
##  if every &D;-class of <A>S</A> is regular.
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareProperty("IsRegularSemigroup", IsSemigroup);
InstallTrueMethod(IsSemigroup, IsRegularSemigroup);


#############################################################################
##
#P  IsInverseSemigroup( <S> )
##
##  <#GAPDoc Label="IsInverseSemigroup">
##  <ManSection>
##    <Prop Name="IsInverseSemigroup" Arg="S"/>
##    <Filt Name="IsInverseMonoid" Arg="S" Type="Category"/>
##    <Returns><K>true</K> or <K>false</K>.</Returns>
##    <Description>
##      A semigroup <A>S</A> is an <E>inverse semigroup</E> if every element
##      <C>x</C> in <A>S</A> has a unique semigroup inverse, that is, a unique
##      element <C>y</C> in <A>S</A> such that <C>x*y*x=x</C> and
##      <C>y*x*y=y</C>.<P/>
##  
##      A monoid that happens to be an inverse semigroup is called an
##      <E>inverse monoid</E>; see <Ref Filt="IsMonoid"/>.
##      <Example>
##  gap> S := Semigroup([
##  >  Transformation([1, 2, 4, 5, 6, 3, 7, 8]),
##  >  Transformation([3, 3, 4, 5, 6, 2, 7, 8]),
##  >  Transformation([1, 2, 5, 3, 6, 8, 4, 4])]);;
##  gap> IsInverseSemigroup(S);
##  true</Example>
##    </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareProperty("IsInverseSemigroup", IsSemigroup);
InstallTrueMethod(IsSemigroup, IsInverseSemigroup);


#############################################################################
##
#O  DisplaySemigroup( <S> )
##
##  <#GAPDoc Label="DisplaySemigroup">
##  <ManSection>
##  <Oper Name="DisplaySemigroup" Arg='S'/>
##
##  <Description>
##  Produces a convenient display of a transformation semigroup's D-Class
##  structure.   Let <A>S</A> be a transformation semigroup of degree
##  <M>n</M>. Then for each <M>r\leq n</M>, we show all D-classes of
##  rank <M>r</M>.   
##  <P/>
##  A regular D-class with a single H-class of size 120 appears as
##  <Log><![CDATA[
##  *[H size = 120, 1 L-class, 1 R-class] 
##  ]]></Log>
##  (the <C>*</C> denoting regularity).
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareOperation("DisplaySemigroup", [IsSemigroup]);

# Everything from here...

DeclareAttribute("NilpotencyDegree", IsSemigroup);

##############################################################################
##
#O IsSubsemigroup( <S>, <T> )
##
## <#GAPDoc Label="IsSubsemigroup">
## <ManSection>
##   <Oper Name="IsSubsemigroup"  Arg="S, T"/>
##   <Returns><K>true</K> or <K>false</K>.</Returns>
##   <Description>
##
##     This operation returns <K>true</K> if the semigroup <A>T</A> is a
##     subsemigroup of the semigroup <A>S</A> and <K>false</K> if it is not.
##     <Example>
## gap> f := Transformation([5, 6, 7, 1, 4, 3, 2, 7]);
## Transformation( [ 5, 6, 7, 1, 4, 3, 2, 7 ] )
## gap> T := Semigroup(f);;
## gap> IsSubsemigroup(FullTransformationSemigroup(4), T);
## false
## gap> S := Semigroup(f);;
## gap> T := Semigroup(f ^ 2);;
## gap> IsSubsemigroup(S, T);
## true</Example>
##   </Description>
## </ManSection>
## <#/GAPDoc>
##
DeclareOperation("IsSubsemigroup", [IsSemigroup, IsSemigroup]);

DeclareProperty("IsBand", IsSemigroup);
DeclareProperty("IsBrandtSemigroup", IsSemigroup);
DeclareProperty("IsCliffordSemigroup", IsSemigroup);
DeclareProperty("IsCommutativeSemigroup", IsSemigroup);
DeclareProperty("IsCompletelyRegularSemigroup", IsSemigroup);
DeclareProperty("IsCompletelySimpleSemigroup", IsSemigroup);
DeclareProperty("IsGroupAsSemigroup", IsSemigroup);
DeclareProperty("IsIdempotentGenerated", IsSemigroup);
DeclareProperty("IsLeftZeroSemigroup", IsSemigroup);
DeclareProperty("IsMonogenicSemigroup", IsSemigroup);
DeclareProperty("IsMonoidAsSemigroup", IsSemigroup);
DeclareProperty("IsNilpotentSemigroup", IsSemigroup);
DeclareProperty("IsOrthodoxSemigroup", IsSemigroup);
DeclareProperty("IsRectangularBand", IsSemigroup);
DeclareProperty("IsRightZeroSemigroup", IsSemigroup);
DeclareProperty("IsSemiband", IsSemigroup);
InstallTrueMethod(IsSemigroup, IsSemiband);

DeclareProperty("IsSemilattice", IsSemigroup);
DeclareProperty("IsZeroSemigroup", IsSemigroup);

InstallTrueMethod(IsMonoidAsSemigroup, IsMagmaWithOne and IsSemigroup);
InstallTrueMethod(IsGroupAsSemigroup, IsMagmaWithInverses and IsSemigroup);
InstallTrueMethod(IsGroupAsSemigroup, IsInverseSemigroup and IsSimpleSemigroup and IsFinite);
InstallTrueMethod(IsGroupAsSemigroup, IsCommutative and IsSimpleSemigroup);
InstallTrueMethod(IsBand, IsSemilattice);
InstallTrueMethod(IsBrandtSemigroup, IsInverseSemigroup and IsZeroSimpleSemigroup);
InstallTrueMethod(IsCliffordSemigroup, IsSemilattice);
InstallTrueMethod(IsCompletelyRegularSemigroup, IsCliffordSemigroup);
InstallTrueMethod(IsCompletelyRegularSemigroup, IsSimpleSemigroup);
InstallTrueMethod(IsCompletelySimpleSemigroup, IsSimpleSemigroup and IsFinite);
InstallTrueMethod(IsIdempotentGenerated, IsBand);
InstallTrueMethod(IsInverseSemigroup, IsSemilattice);
InstallTrueMethod(IsInverseSemigroup, IsCliffordSemigroup);
InstallTrueMethod(IsInverseSemigroup, IsGroupAsSemigroup);
InstallTrueMethod(IsLeftZeroSemigroup, IsInverseSemigroup and IsTrivial);
InstallTrueMethod(IsRegularSemigroup, IsInverseSemigroup);
InstallTrueMethod(IsRegularSemigroup, IsSimpleSemigroup);
InstallTrueMethod(IsOrthodoxSemigroup, IsInverseSemigroup);
InstallTrueMethod(IsRightZeroSemigroup, IsInverseSemigroup and IsTrivial);
InstallTrueMethod(IsSemiband, IsIdempotentGenerated and IsSemigroup);
InstallTrueMethod(IsSemilattice, IsCommutative and IsBand);
InstallTrueMethod(IsSimpleSemigroup, IsGroupAsSemigroup);
InstallTrueMethod(IsZeroSemigroup, IsInverseSemigroup and IsTrivial);

# ...to here was added by JDM / WW.

# the following allow us to only use a single method for ViewString for
# semigroups of transformations and partial perms.

DeclareOperation("SemigroupViewStringPrefix", [IsSemigroup]);
DeclareOperation("SemigroupViewStringSuffix", [IsSemigroup]);
